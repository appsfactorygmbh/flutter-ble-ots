import 'package:freezed_annotation/freezed_annotation.dart';

import '../otp_ble_constants.dart';
import '../utils.dart';

part 'object_properties.freezed.dart';

@freezed
class ObjectProperties with _$ObjectProperties {
  const ObjectProperties._();
  const factory ObjectProperties({
    @Default(false) bool delete,
    @Default(false) bool execute,
    @Default(false) bool read,
    @Default(false) bool write,
    @Default(false) bool append,
    @Default(false) bool truncate,
    @Default(false) bool patch,
    @Default(false) bool mark,
  }) = _ObjectProperties;

  factory ObjectProperties.fromByteArray(List<int> byteArray) {
    if (byteArray.length == OtpBleConstants.INT_SIZE) {
      final bits = Utils.getBoolListFromIntList(byteArray, OtpBleConstants.INT_SIZE * 8);
      return ObjectProperties(
        delete: bits[0],
        execute: bits[1],
        read: bits[2],
        write: bits[3],
        append: bits[4],
        truncate: bits[5],
        patch: bits[6],
        mark: bits[7],
      );
    } else {
      throw Exception('Failed to parse OLCP-Features, byte array has wrong size: ${byteArray.length}');
    }
  }
}
