import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_ble_ots/src/models/oacp_features.dart';
import 'package:flutter_ble_ots/src/models/object_properties.dart';
import 'package:flutter_ble_ots/src/utils.dart';

import '../flutter_ble_ots.dart';
import 'bluetooth_controller.dart';
import 'data_transformer.dart';
import 'models/oacp_response.dart';
import 'models/olcp_features.dart';
import 'models/ots_features.dart';
import 'oacp_constants.dart';
import 'oacp_op_code_utils.dart';
import 'olcp_constants.dart';
import 'otp_ble_constants.dart';
import 'olcp_op_code_utils.dart';

class ObjectTransferProtocol {
  final Map<List<int>, ObjectMetaData> _knownMetaData = {};

  final String _deviceId;
  final BleDeviceInteractor _ble;
  final void Function(String message) _logMessage;
  late final BluetoothController _controller;
  final MetaDataUuids _metaDataUuids;
  final String Function(Uint8List uuid)? _getNameFromUuid;

  ObjectTransferProtocol(this._ble, this._deviceId, this._logMessage, this._metaDataUuids, this._getNameFromUuid) {
    _controller = BluetoothController(_ble, _deviceId, _metaDataUuids, _logMessage);
  }

  Future<OtsFeatures?> discoverFeatures({CommonConnectionPriority? priority}) async {
    try {
      if (Platform.isAndroid && priority != null) {
        await _ble.requestConnectionPriority(priority, _deviceId);
      }
      const oacpLowerBound = 0;
      const oacpUpperBound = 4;
      const olcpLowerBound = 4;
      const olcpUpperBound = 8;

      final readResponse = await _controller.readCharacteristic(_metaDataUuids.featureDiscoveryUuid);

      final oacp = OACPFeatures.fromList(readResponse.sublist(oacpLowerBound, oacpUpperBound));
      final olcp = OLCPFeatures.fromList(readResponse.sublist(olcpLowerBound, olcpUpperBound));
      return OtsFeatures(oacpFeatures: oacp, olcpFeatures: olcp);
    } catch (e) {
      _logMessage(e.toString());
    }

    return null;
  }

  void observeServiceId(Uint8List serviceUuid) {
    _controller.observeCustomServiceId(serviceUuid);
  }

  Future<List<int>> waitForCustomUuidChanged(Uint8List serviceUuid, DateTime afterTime) => _controller.getLastResponseOfCustomServiceId(
        serviceUuid,
        afterTime,
      );

  Future<ObjectMetaData?> _gotoObjectAndReadMetaData(List<int> id) async {
    try {
      _logMessage('goto id $id');
      final command = OlcpOpCodeUtils.getOLCPAsByteArray(OLCPConstants.GO_TO, id);
      final writeSuccess = await _controller.writeCharacteristic(_metaDataUuids.olcpUuid, command);
      if (writeSuccess) {
        if (_knownMetaData.containsKey(id)) {
          return _knownMetaData[id];
        }
        final metaData = await _getMetaDataOfCurrentObject();
        _knownMetaData[id] = metaData;
        return metaData;
      }
    } catch (e) {
      _logMessage(e.toString());
    }
    return null;
  }

  String toHex(List<int> input) {
    return input.map((i) => i.toRadixString(16).padLeft(2, '0')).join();
  }

  Future<ObjectMetaData> _getMetaDataOfCurrentObject() async {
    final objectId = await _controller.readCharacteristic(_metaDataUuids.objectIdUuid);
    final objectName = BluetoothUtils.getStringFromTransmittedCharArray(await _controller.readCharacteristic(_metaDataUuids.objectNameUuid));
    final objectSize = await _controller.readCharacteristic(_metaDataUuids.objectSizeUuid);
    final objectProperties = ObjectProperties.fromByteArray(await _controller.readCharacteristic(_metaDataUuids.objectPropertiesUuid));
    _logMessage('new meta data: id: ${toHex(objectId)} name: $objectName size: ${toHex(objectSize)}');
    return ObjectMetaData(id: objectId, size: objectSize, name: objectName, objectProperties: objectProperties);
  }

  Future<bool> _writeCurrentObject(
    OACPFeatures oacpFeatures,
    ObjectMetaData currentObjectMetaData,
    List<int> input, [
    int offset = 0,
  ]) async {
    try {
      if (!_isWriteAllowed(oacpFeatures, currentObjectMetaData)) {
        return false;
      }

      final bytesTransmitted = await _sendData(input, offset, currentObjectMetaData);

      if (bytesTransmitted != input.length) {
        _logMessage('transmitted $bytesTransmitted, but input has length ${input.length}');
        return false;
      }
      return true;
    } catch (e) {
      _logMessage(e.toString());
    }

    return false;
  }

  Future<int> _sendData(List<int> data, int offset, ObjectMetaData currentObjectMetaData) async {
    if (data.isEmpty) {
      throw Exception('EmptyTransmissionDataException()');
    }

    try {
      final mtu = await _ble.requestMtu(OtpBleConstants.MAX_MTU, _deviceId);
      final toTransmit = Utils.splitArrayIntoChunks(data, OtpBleConstants.MAX_BULK_WRITE_SIZE);
      var sendObjectDataSize = 0;

      for (final objectChunk in toTransmit) {
        var sendChunkDataSize = 0;
        final oacpCommand = OacpOpCodeUtils.getWriteRequest(
          offset,
          objectChunk.length,
          OacpOpCodeUtils.getModeByte(false),
        );

        final oacpResponse = await _sendOacpCommand(oacpCommand);
        if (oacpResponse != null) {
          if (oacpResponse.resultCode == OACPConstants.SUCCESS) {
            var failCounter = 0;
            while (sendChunkDataSize != objectChunk.length) {
              final payload = Utils.splitArrayTillMaxSize(
                sendChunkDataSize,
                mtu,
                objectChunk,
              );

              if (await _sendDataChunk(payload)) {
                sendChunkDataSize += payload.length;
                sendObjectDataSize += payload.length;
                failCounter = 0;
              } else {
                failCounter++;
              }
              if (failCounter == OtpBleConstants.MAX_RETRY_COUNT) {
                throw Exception('CommunicationException("send data", $currentObjectMetaData)');
              }
            }
          } else {
            throw Exception('OACPResponseException(${oacpResponse.resultCode})');
          }
        }
      }
      return sendObjectDataSize;
    } catch (e) {
      _logMessage(e.toString());
    }

    return -1;
  }

  Future<bool> _sendDataChunk(List<int> payload) async {
    try {
      final writeResponse = await _controller.writeCharacteristic(_metaDataUuids.transmissionUuid, payload);

      if (writeResponse) {
        return true;
      } else {
        throw Exception('GattResponseException(writeResponse)');
      }
    } catch (e) {
      _logMessage(e.toString());
    }

    return false;
  }

  Future<List<int>?> _readCurrentObject(
    OACPFeatures oacpFeatures,
    ObjectMetaData currentObjectMetaData,
  ) async {
    if (!_isReadAllowed(oacpFeatures, currentObjectMetaData)) {
      return null;
    }

    final size = DataTransformer.getCurrentSizeFromByteArray(currentObjectMetaData.size);
    var offset = 0;
    var failCounter = 0;
    var finished = false;
    final List<int> object = [];
    while (!finished) {
      final chunk = await _getNextDataChunk(offset, size);
      final newOffset = offset + chunk.length;
      if (newOffset == offset) {
        failCounter++;
      } else {
        offset = newOffset;
      }

      if (failCounter == 3) {
        throw Exception('CommunicationException("read", $currentObjectMetaData)');
      }

      finished = (offset == size) || chunk.isEmpty;
      object.addAll(chunk);
    }
    _logMessage('read object $object with size $size meta: $currentObjectMetaData');
    return object;
  }

  Future<List<int>> _getNextDataChunk(int offset, int size) async {
    _logMessage('next chunk start');
    int length = await _ble.requestMtu(OtpBleConstants.MAX_TRANSMISSION_SIZE, _deviceId);
    _logMessage('next chunk requested mtu');

    if (offset + length > size) {
      length = size - offset;
    }
    try {
      final oacpCommand = OacpOpCodeUtils.getReadRequest(offset, length);
      _logMessage('sending chunk send oacp');
      final oacpResponse = await _sendOacpCommand(oacpCommand);
      _logMessage('sending chunk sent oacp');

      if (oacpResponse != null) {
        if (oacpResponse.resultCode == OACPConstants.SUCCESS) {
          return await _getDataChunk(_metaDataUuids.transmissionUuid, length);
        } else {
          throw Exception('OACPResponseException ${oacpResponse.resultCode}');
        }
      }
    } catch (e) {
      _logMessage(e.toString());
    }

    return [];
  }

  Future<List<int>> _getDataChunk(Uint8List characteristicUUID, int length) async {
    try {
      final readResponse = await _controller.readCharacteristic(characteristicUUID);

      if (readResponse.length == length) {
        return readResponse;
      } else if (readResponse.length > length) {
        return readResponse.sublist(0, length);
      }
      throw Exception(
        'WrongInputSizeException(Data from ${_getNameFromUuid == null ? characteristicUUID : _getNameFromUuid!(characteristicUUID)}, $length, $readResponse)',
      );
    } catch (e) {
      _logMessage(e.toString());
    }

    return [];
  }

  Future<OacpResponse?> _sendOacpCommand(List<int> oacpCommand) async {
    try {
      final now = DateTime.now();
      final writeResponse = await _controller.writeCharacteristic(_metaDataUuids.oacpUuid, oacpCommand);
      if (writeResponse) {
        return _controller.getOacpChanged(now);
      }
    } catch (e) {
      _logMessage(e.toString());
    }

    return null;
  }

  bool _isWriteAllowed(OACPFeatures oacpFeatures, ObjectMetaData objectMetaData) {
    if (!oacpFeatures.writeOpCodeSupported || !objectMetaData.objectProperties.write) {
      return false;
    }
    return true;
  }

  bool _isReadAllowed(OACPFeatures oacpFeatures, ObjectMetaData objectMetaData) {
    if (!oacpFeatures.readOpCodeSupported || !objectMetaData.objectProperties.read) {
      return false;
    }
    return true;
  }

  Future<List<int>?> readDataFromId(OACPFeatures oacpFeatures, List<int> id) async {
    try {
      _logMessage('getting meta');
      final metaData = await _gotoObjectAndReadMetaData(id);
      _logMessage('got meta $metaData');
      if (metaData != null) {
        return await _readCurrentObject(oacpFeatures, metaData);
      }
    } catch (e) {
      _logMessage(e.toString());
    }
    return null;
  }

  bool _isExecuteAllowed(OACPFeatures oacpFeatures, ObjectMetaData metaData) {
    if (!oacpFeatures.executeOpCodeSupported) {
      _logMessage('OperationNotSupportedException("execute")');
      return false;
    }

    if (!metaData.objectProperties.execute) {
      _logMessage('OperationNotSupportedException("execute")');
      return false;
    }

    return true;
  }

  Future<bool> executeId(List<int> id, OACPFeatures oacpFeatures) async {
    try {
      final metaData = await _gotoObjectAndReadMetaData(id);
      if (metaData == null) {
        _logMessage('couldnt get meta data for id $id');
        return false;
      }
      if (!_isExecuteAllowed(oacpFeatures, metaData)) {
        return false;
      }

      final oacpCommand = OacpOpCodeUtils.getExecuteRequest();

      final oacpResponse = await _sendOacpCommand(oacpCommand);

      if (oacpResponse != null) {
        return oacpResponse.resultCode == OACPConstants.SUCCESS;
      }
    } catch (e) {
      _logMessage(e.toString());
    }

    return false;
  }

  Future<bool> writeDataToId(OACPFeatures oacpFeatures, List<int> id, List<int> value) async {
    try {
      final metaData = await _gotoObjectAndReadMetaData(id);
      if (metaData != null) {
        return await _writeCurrentObject(oacpFeatures, metaData, value);
      }
      _logMessage('write num of objects');
    } catch (e) {
      _logMessage(e.toString());
    }
    return false;
  }

  Future<List<ObjectMetaData>> getListOfSupportedUuids() async {
    final List<ObjectMetaData> metaData = [];
    var command = [OLCPConstants.FIRST];
    var now = DateTime.now();
    await _controller.writeCharacteristic(_metaDataUuids.olcpUuid, command);

    while ((await _controller.getOlcpChanged(now)).resultCode == OLCPConstants.SUCCESS) {
      metaData.add(await _getMetaDataOfCurrentObject());
      command = [OLCPConstants.NEXT];
      now = DateTime.now();
      await _controller.writeCharacteristic(_metaDataUuids.olcpUuid, command);
    }
    return metaData;
  }

  Future<void> cancelSubscriptions() => _controller.cancelSubscriptions();
}
