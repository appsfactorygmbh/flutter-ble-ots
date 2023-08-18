import 'package:freezed_annotation/freezed_annotation.dart';

import 'oacp_features.dart';
import 'olcp_features.dart';

part 'ots_features.freezed.dart';

@freezed
class OtsFeatures with _$OtsFeatures {
  const factory OtsFeatures({required OACPFeatures oacpFeatures, required OLCPFeatures olcpFeatures}) = _OtsFeatures;
}
