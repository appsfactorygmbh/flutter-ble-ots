import 'package:freezed_annotation/freezed_annotation.dart';

part 'oacp_response.freezed.dart';

@freezed
class OacpResponse with _$OacpResponse {
  const factory OacpResponse({
    required int requestCode,
    required int resultCode,
    @Default( []) List<int> responseParameter,
  }) = _OacpResponse;

  factory OacpResponse.fromByteArray(List<int> byteArray) =>
      OacpResponse(requestCode: byteArray[0], resultCode: byteArray[1], responseParameter: byteArray.sublist(2, byteArray.length));
}
