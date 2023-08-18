import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleDeviceInteractorImpl extends BleDeviceInteractor {
  final FlutterReactiveBle _ble;

  BleDeviceInteractorImpl(this._ble);

  QualifiedCharacteristic _getReactiveCharacteristicFromCommon(CommonCharacteristic char) => QualifiedCharacteristic(
        characteristicId: Uuid(char.characteristicId),
        serviceId: Uuid(char.serviceId),
        deviceId: char.deviceId,
      );

  ConnectionPriority _getReactivePriorityFromCommon(CommonConnectionPriority prio) {
    switch (prio) {
      case CommonConnectionPriority.balanced:
        return ConnectionPriority.balanced;
      case CommonConnectionPriority.highPerformance:
        return ConnectionPriority.highPerformance;
      case CommonConnectionPriority.lowPower:
        return ConnectionPriority.lowPower;
    }
  }

  @override
  Future<List<int>> readCharacteristic(CommonCharacteristic characteristic) =>
      _ble.readCharacteristic(_getReactiveCharacteristicFromCommon(characteristic));

  @override
  Future<void> requestConnectionPriority(CommonConnectionPriority priority, String deviceId) =>
      _ble.requestConnectionPriority(deviceId: deviceId, priority: _getReactivePriorityFromCommon(priority));

  @override
  Future<int> requestMtu(int mtu, String deviceId) => _ble.requestMtu(deviceId: deviceId, mtu: mtu);

  @override
  Stream<List<int>> subscribeToCharacteristic(CommonCharacteristic characteristic) =>
      _ble.subscribeToCharacteristic(_getReactiveCharacteristicFromCommon(characteristic));

  @override
  Future<void> writeCharacteristicWithResponse(CommonCharacteristic characteristic, List<int> value) =>
      _ble.writeCharacteristicWithResponse(_getReactiveCharacteristicFromCommon(characteristic), value: value);

  @override
  Future<void> writeCharacteristicWithoutResponse(CommonCharacteristic characteristic, List<int> value) =>
      _ble.writeCharacteristicWithoutResponse(_getReactiveCharacteristicFromCommon(characteristic), value: value);
}
