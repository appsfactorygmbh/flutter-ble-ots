import 'package:freezed_annotation/freezed_annotation.dart';

import '../otp_ble_constants.dart';
import '../utils.dart';

part 'olcp_features.freezed.dart';

@freezed
class OLCPFeatures with _$OLCPFeatures {
  const OLCPFeatures._();
  const factory OLCPFeatures(
    bool goToOpCodeSupported,
    bool orderOpCodeSupported,
    bool requestNumberOfObjectsOpCodeSupported,
    bool clearMarkingOpCodeSupported,
  ) = _OLCPFeatures;

  factory OLCPFeatures.fromList(List<int> byteArray) {
    if (byteArray.length == OtpBleConstants.INT_SIZE) {
      final bits = Utils.getBoolListFromIntList(byteArray, OtpBleConstants.INT_SIZE * 8);
      return OLCPFeatures(bits[0], bits[1], bits[2], bits[3]);
    } else {
      throw Exception('Failed to parse OLCP-Features, byte array has wrong size: ${byteArray.length}');
    }
  }
}
