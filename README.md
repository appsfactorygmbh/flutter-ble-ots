# flutter_ble_ots

A Flutter package for easy interaction with Bluetooth devices using the Bluetooth Open Transfer Service (OTS) Protocol. This package simplifies the process of reading, writing, and executing actions on Bluetooth devices that support the OTS protocol.

**Note:** The functionalities provided by this package are based on the official [Bluetooth Object Transfer Service 1.0 specification](https://www.bluetooth.com/specifications/specs/object-transfer-service-1-0/).

## Features

- Abstracts complex interactions with Bluetooth devices using the OTS protocol.
- Works with various BLE packages like `flutter_reactive_ble` or `flutter_blue_plus`.
- Provides easy-to-use methods for reading, writing, and executing actions on device IDs.
- Handles metadata retrieval and communication intricacies under the hood.

## Usage

1. Import the package:

```dart
import 'package:flutter_ble_ots/flutter_ble_ots.dart';
```

2. Implement the `BleDeviceInteractor` interface for your BLE package, for example using `flutter_reactive_ble`. See the provided example implementation in the example folder.

3. Create an instance of BleOtsWrapper:
```dart
final bleWrapper = BleOtsWrapper(
  deviceId,
  bleDeviceInteractor,
  logMessageCallback,
  metaDataUuids,
  getNameFromUuidCallback,
);
```

4. Initialize the wrapper by calling `init()`:
```dart
await bleWrapper.init();
```

5. Start using the package's simplified methods:
```dart
final supportedUuids = await bleWrapper.getListOfSupportedUuids();
final data = await bleWrapper.readDataFromId(id);
final success = await bleWrapper.writeDataToId(id, value);
final result = await bleWrapper.executeId(id);
```

## Example Implementation of BleDeviceInteractor
For integrating flutter_reactive_ble as your BLE package, you can implement the `BleDeviceInteractor` interface as shown in the following example:

```dart
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
```

## Metadata UUIDs
In order to communicate with a Bluetooth device using the OTS protocol, you need to provide the metadata UUIDs for the device. These UUIDs should be defined by the Bluetooth device manufacturer and can be provided as a `MetaDataUuids` instance:

```dart
MetaDataUuids(
    featureDiscoveryUuid: Uuid.parse('2abd').data,
    oacpUuid: Uuid.parse('2ac5').data,
    objectIdUuid: Uuid.parse('2ac3').data,
    objectNameUuid: Uuid.parse('2abe').data,
    objectPropertiesUuid: Uuid.parse('2ac4').data,
    objectSizeUuid: Uuid.parse('2ac0').data,
    olcpUuid: Uuid.parse('2ac6').data,
    otsUuid: Uuid.parse('1825').data,
    transmissionUuid: Uuid.parse('3bc9').data,
)
```

For more details, refer to the [official Bluetooth Object Transfer Service 1.0 specification](https://www.bluetooth.com/specifications/specs/object-transfer-service-1-0/).

## Contributing
Contributions to this package are welcome! If you encounter any issues or have suggestions for improvements, please feel free to create an issue or submit a pull request. For more infos check the CONTRIBUTING.md

## License
This package is released under the MIT License.