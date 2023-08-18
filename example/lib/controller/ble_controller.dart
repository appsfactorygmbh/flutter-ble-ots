import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_ble_ots_example/controller/uuid_constants.dart';
import 'package:flutter_ble_ots_example/services/providers.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/ble_scanner.dart';
import 'ble_state.dart';

final bleControllerProvider = StateNotifierProvider<BleController, BleState>((ref) {
  return BleController(ref.watch(scannerProvider), ref.watch(bleDeviceInteractorProvider), ref.watch(bleProvider));
});

class BleController extends StateNotifier<BleState> {
  final BleScanner _scanner;
  final Completer<BleOtsWrapper> _otsWrapper = Completer();

  final BleDeviceInteractor _deviceInteractor;
  final FlutterReactiveBle _ble;
  late final StreamSubscription<BleScannerState> _scanSubscription;
  StreamSubscription<ConnectionStateUpdate>? _deviceSubscription;
  BleController(this._scanner, this._deviceInteractor, this._ble) : super(const BleState.idle()) {
    _scanSubscription = _scanner.state.listen((scannerState) {
      state.maybeWhen(
        scanning: (_) {
          state = BleState.scanning(devices: scannerState.discoveredDevices);
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    _scanSubscription.cancel();
    super.dispose();
  }

  void startScan() {
    state = const BleState.scanning(devices: []);
    _scanner.startScan([]);
  }

  void stopScan() {
    state = const BleState.idle();
    _scanner.stopScan();
  }

  void connect(DiscoveredDevice device) {
    final deviceId = device.id;
    state = BleState.connecting(deviceId: deviceId);
    _scanner.stopScan();
    _deviceSubscription = _ble.connectToDevice(id: deviceId).listen((connectionState) async {
      final updateState = state.maybeMap(
        connecting: (s) => s.deviceId == deviceId,
        connected: (s) => s.deviceId == deviceId,
        orElse: () => false,
      );
      if (updateState) {
        switch (connectionState.connectionState) {
          case DeviceConnectionState.connected:
            _otsWrapper.complete(
              BleOtsWrapper(
                deviceId,
                _deviceInteractor,
                _logMessage,
                UuidConstants.metaDataUuids,
                UuidConstants.getNameFromUuid,
              ),
            );
            final ots = await _otsWrapper.future;
            state = BleState.connected(deviceId: deviceId, lastMessage: null, supportedUuids: [], loading: true);
            final connectedState = state as BleStateConnected;

            await ots.init();
            final uuids = await ots.getListOfSupportedUuids();
            state = connectedState.copyWith(supportedUuids: uuids, loading: false);

            break;
          case DeviceConnectionState.connecting:
            break;
          case DeviceConnectionState.disconnecting:
            break;
          case DeviceConnectionState.disconnected:
            state = const BleState.idle();
            await _deviceSubscription?.cancel();
            break;
        }
      }
    });
  }

  void disconnect() {
    state.maybeWhen(
        connecting: (_) {
          state = const BleState.idle();
        },
        connected: (_, __, ___, ____) {
          state = const BleState.idle();
        },
        orElse: () {});
    _deviceSubscription?.cancel();
  }

  void readFromId(List<int> characteristicId) async {
    await state.maybeMap(
        connected: (s) async {
          state = s.copyWith(loading: true);
          final ots = await _otsWrapper.future;
          final res = await ots.readDataFromId(
            characteristicId,
          );
          state = s.copyWith(
            lastMessage: res == null
                ? null
                : getHexFromUint8List(
                    Uint8List.fromList(res),
                  ),
            loading: false,
          );
        },
        orElse: () {});
  }

  void writeToId(List<int> characteristicId) async {
    await state.maybeMap(
        connected: (s) async {
          state = s.copyWith(loading: true);
          final ots = await _otsWrapper.future;
          await ots.writeDataToId(
            characteristicId,
            getUint8ListFromHex('test'),
          );
          state = s.copyWith(loading: false);
        },
        orElse: () {});
  }

  String getHexFromUint8List(Uint8List inputAsUint8List) => String.fromCharCodes(inputAsUint8List);

  Uint8List getUint8ListFromHex(String inputAsHex) => Uint8List.fromList(inputAsHex.codeUnits);

  void _logMessage(String msg) {
    log('msg from OTS: $msg');
  }
}
