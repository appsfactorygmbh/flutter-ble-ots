import 'package:freezed_annotation/freezed_annotation.dart';

import '../otp_ble_constants.dart';
import '../utils.dart';

part 'oacp_features.freezed.dart';

@freezed
class OACPFeatures with _$OACPFeatures {
  const OACPFeatures._();
  const factory OACPFeatures(
    bool createOpCodeSupported,
    bool deleteOpCodeSupported,
    bool calculateChecksumOpCodeSupported,
    bool executeOpCodeSupported,
    bool readOpCodeSupported,
    bool writeOpCodeSupported,
    bool appendingAdditionalDataToObjectsSupported,
    bool truncationOfObjectsSupported,
    bool patchingOfObjectsSupported,
    bool abortOpCodeSupported,
  ) = _OACPFeatures;

  factory OACPFeatures.fromList(List<int> byteArray) {
    if (byteArray.length == OtpBleConstants.INT_SIZE) {
      final bits = Utils.getBoolListFromIntList(byteArray, OtpBleConstants.INT_SIZE * 8);
      return OACPFeatures(bits[0], bits[1], bits[2], bits[3], bits[4], bits[5], bits[6], bits[7], bits[8], bits[9]);
    } else {
      throw Exception('Failed to parse OACP-Features, byte array has wrong size: ${byteArray.length}');
    }
  }
}
