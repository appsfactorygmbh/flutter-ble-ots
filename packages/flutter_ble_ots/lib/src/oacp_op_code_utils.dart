import 'package:flutter_ble_ots/src/utils.dart';

import 'oacp_constants.dart';

class OacpOpCodeUtils {
  static List<int> getReadRequest(int offset, int length) {
    if (_isIntParameterValid(offset) && _isIntParameterValid(length)) {
      return [OACPConstants.READ] + Utils.getIntAsByteArray(offset) + Utils.getIntAsByteArray(length);
    } else {
      throw Exception('InvalidOACPCommandParameterException("read")');
    }
  }

  static List<int> getExecuteRequest() => [OACPConstants.EXECUTE];

  static List<int> getWriteRequest(int offset, int length, int mode) {
    if (_isIntParameterValid(offset) && _isIntParameterValid(length)) {
      return [OACPConstants.WRITE, ...Utils.getIntAsByteArray(offset), ...Utils.getIntAsByteArray(length), mode];
    } else {
      throw Exception('InvalidOACPCommandParameterException("write")');
    }
  }

  static int getModeByte(bool truncate) {
    List<bool> bitSet = List.generate(8, (_) => false);

    bitSet[0] = false;
    bitSet[1] = truncate;
    for (int x = 2; x < 8; x++) {
      bitSet[x] = false;
    }

    return Utils.getIntFromBoolList(bitSet.reversed.toList());
  }

  static bool _isIntParameterValid(int value) => value >= 0;
}
