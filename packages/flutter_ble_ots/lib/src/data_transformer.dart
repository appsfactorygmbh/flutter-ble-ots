import 'dart:typed_data';

import 'package:flutter_ble_ots/src/otp_ble_constants.dart';

class DataTransformer {
  static int getCurrentSizeFromByteArray(List<int> list) {
    final input = Uint8List.fromList(list);
    if (input.length == OtpBleConstants.OBJECT_SIZE_SIZE) {
      final Uint8List currentSizeByteArray = input.sublist(0, 4);
      final ByteData data = currentSizeByteArray.buffer.asByteData();
      return data.getInt32(0, Endian.little);
    } else {
      throw Exception('WrongInputSizeException("Current size", ${OtpBleConstants.OBJECT_SIZE_SIZE}, $input)');
    }
  }
}
