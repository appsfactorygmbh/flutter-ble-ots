import 'models/common_ble_models/common_ble_models.dart';

abstract class BleDeviceInteractor {
  Future<List<int>> readCharacteristic(CommonCharacteristic characteristic);
  Future<void> writeCharacteristicWithResponse(CommonCharacteristic characteristic, List<int> value);
  Future<void> writeCharacteristicWithoutResponse(CommonCharacteristic characteristic, List<int> value);
  Future<void> requestConnectionPriority(CommonConnectionPriority priority, String deviceId);
  Future<int> requestMtu(int mtu, String deviceId);
  Stream<List<int>> subscribeToCharacteristic(CommonCharacteristic characteristic);
}
