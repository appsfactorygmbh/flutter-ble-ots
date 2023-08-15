import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_response.freezed.dart';

@freezed
class LastResponse<Type> with _$LastResponse<Type> {
  factory LastResponse({required DateTime timeStamp, required Type response}) = _LastResponse;
}
