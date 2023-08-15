import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_characteristic.freezed.dart';

@freezed
class CommonCharacteristic with _$CommonCharacteristic {
  factory CommonCharacteristic({
    required Uint8List characteristicId,
    required Uint8List serviceId,
    required String deviceId,
  }) = _CommonCharacteristic;
}
