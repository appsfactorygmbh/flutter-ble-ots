// ignore_for_file: unused_field

import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_ble_ots/src/ble_device_interactor.dart';
import 'package:flutter_ble_ots/src/models/meta_data_uuids.dart';
import 'package:flutter_ble_ots/src/models/oacp_response.dart';
import 'package:flutter_ble_ots/src/otp_ble_constants.dart';

import 'models/common_ble_models/common_ble_models.dart';
import 'models/last_response.dart';
import 'models/olcp_response.dart';

class BluetoothController {
  final BleDeviceInteractor _ble;
  final String _deviceId;
  final MetaDataUuids _metaDataUuids;
  LastResponse<OacpResponse>? _lastOacpResponse;
  LastResponse<OlcpResponse>? _lastOlcpResponse;
  StreamSubscription<List<int>>? _oacpSub;
  StreamSubscription<List<int>>? _olcpSub;
  final Function(String msg) _logMessage;
  final Map<Uint8List, LastResponse> _lastCustomResponses = {};
  final Map<Uint8List, StreamSubscription<List<int>>> _customSubs = {};

  BluetoothController(this._ble, this._deviceId, this._metaDataUuids, this._logMessage) {
    _oacpSub = _subscribeToCharacteristic(_metaDataUuids.oacpUuid).listen((res) {
      final oacpResponse = OacpResponse.fromByteArray(res);
      _logMessage('new oac event $oacpResponse');
      _lastOacpResponse = LastResponse(timeStamp: DateTime.now(), response: oacpResponse);
    });
    _olcpSub = _subscribeToCharacteristic(_metaDataUuids.olcpUuid).listen((res) {
      final olcpRes = OlcpResponse.fromByteArray(res);
      _logMessage('new change olcp event $olcpRes');
      _lastOlcpResponse = LastResponse(timeStamp: DateTime.now(), response: olcpRes);
    });
  }

  void observeCustomServiceId(Uint8List characteristicUuid) {
    _customSubs[characteristicUuid] = _ble
        .subscribeToCharacteristic(
      CommonCharacteristic(characteristicId: characteristicUuid, serviceId: _metaDataUuids.otsUuid, deviceId: _deviceId),
    )
        .listen((event) {
      _lastCustomResponses[characteristicUuid] = LastResponse(timeStamp: DateTime.now(), response: event);
    });
  }

  Future<List<int>> getLastResponseOfCustomServiceId(Uint8List characteristicUuid, DateTime afterTime) async {
    if (!_customSubs.containsKey(characteristicUuid)) {
      throw Exception('observe custom service Id before listening to it. Service id is $characteristicUuid');
    }
    while (_lastCustomResponses[characteristicUuid] == null || _lastCustomResponses[characteristicUuid]!.timeStamp.isBefore(afterTime)) {
      await Future.delayed(OtpBleConstants.sleepDuration);
    }
    return _lastCustomResponses[characteristicUuid]!.response;
  }

  Stream<List<int>> _subscribeToCharacteristic(Uint8List characteristicUuid) {
    return _ble.subscribeToCharacteristic(
      CommonCharacteristic(characteristicId: characteristicUuid, serviceId: _metaDataUuids.otsUuid, deviceId: _deviceId),
    );
  }

  Future<List<int>> readCharacteristic(Uint8List characteristicUuid) async {
    log('readcharacteristic $characteristicUuid');
    final char = await _ble.readCharacteristic(
      CommonCharacteristic(characteristicId: characteristicUuid, serviceId: _metaDataUuids.otsUuid, deviceId: _deviceId),
    );
    log('readcharacteristic FINISHED $char');
    return char;
  }

  Future<OacpResponse> getOacpChanged(DateTime afterTime) async {
    int sleepCounter = 0;
    while ((_lastOacpResponse?.timeStamp.isBefore(afterTime) ?? true) || sleepCounter > OtpBleConstants.maxSleepAmount) {
      await Future.delayed(OtpBleConstants.sleepDuration);
      sleepCounter++;
    }
    return _lastOacpResponse!.response;
  }

  Future<OlcpResponse> getOlcpChanged(DateTime afterTime) async {
    while (_lastOlcpResponse?.timeStamp.isBefore(afterTime) ?? true) {
      await Future.delayed(OtpBleConstants.sleepDuration);
    }
    return _lastOlcpResponse!.response;
  }

  Future<bool> writeCharacteristic(Uint8List characteristicUuid, List<int> value, {bool waitForResponse = true}) async {
    log('writeCharacteristic $characteristicUuid value $value');
    try {
      if (waitForResponse) {
        await _ble.writeCharacteristicWithResponse(
          CommonCharacteristic(characteristicId: characteristicUuid, serviceId: _metaDataUuids.otsUuid, deviceId: _deviceId),
          value,
        );
      } else {
        await _ble.writeCharacteristicWithoutResponse(
          CommonCharacteristic(characteristicId: characteristicUuid, serviceId: _metaDataUuids.otsUuid, deviceId: _deviceId),
          value,
        );
      }
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> cancelSubscriptions() async {
    await _oacpSub?.cancel();
    await _olcpSub?.cancel();
    for (final s in _customSubs.values) {
      await s.cancel();
    }
  }
}
