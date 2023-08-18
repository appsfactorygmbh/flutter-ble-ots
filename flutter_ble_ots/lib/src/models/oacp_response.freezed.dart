// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oacp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OacpResponse {
  int get requestCode => throw _privateConstructorUsedError;
  int get resultCode => throw _privateConstructorUsedError;
  List<int> get responseParameter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OacpResponseCopyWith<OacpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OacpResponseCopyWith<$Res> {
  factory $OacpResponseCopyWith(
          OacpResponse value, $Res Function(OacpResponse) then) =
      _$OacpResponseCopyWithImpl<$Res, OacpResponse>;
  @useResult
  $Res call({int requestCode, int resultCode, List<int> responseParameter});
}

/// @nodoc
class _$OacpResponseCopyWithImpl<$Res, $Val extends OacpResponse>
    implements $OacpResponseCopyWith<$Res> {
  _$OacpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestCode = null,
    Object? resultCode = null,
    Object? responseParameter = null,
  }) {
    return _then(_value.copyWith(
      requestCode: null == requestCode
          ? _value.requestCode
          : requestCode // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseParameter: null == responseParameter
          ? _value.responseParameter
          : responseParameter // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OacpResponseCopyWith<$Res>
    implements $OacpResponseCopyWith<$Res> {
  factory _$$_OacpResponseCopyWith(
          _$_OacpResponse value, $Res Function(_$_OacpResponse) then) =
      __$$_OacpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int requestCode, int resultCode, List<int> responseParameter});
}

/// @nodoc
class __$$_OacpResponseCopyWithImpl<$Res>
    extends _$OacpResponseCopyWithImpl<$Res, _$_OacpResponse>
    implements _$$_OacpResponseCopyWith<$Res> {
  __$$_OacpResponseCopyWithImpl(
      _$_OacpResponse _value, $Res Function(_$_OacpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestCode = null,
    Object? resultCode = null,
    Object? responseParameter = null,
  }) {
    return _then(_$_OacpResponse(
      requestCode: null == requestCode
          ? _value.requestCode
          : requestCode // ignore: cast_nullable_to_non_nullable
              as int,
      resultCode: null == resultCode
          ? _value.resultCode
          : resultCode // ignore: cast_nullable_to_non_nullable
              as int,
      responseParameter: null == responseParameter
          ? _value._responseParameter
          : responseParameter // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_OacpResponse implements _OacpResponse {
  const _$_OacpResponse(
      {required this.requestCode,
      required this.resultCode,
      final List<int> responseParameter = const []})
      : _responseParameter = responseParameter;

  @override
  final int requestCode;
  @override
  final int resultCode;
  final List<int> _responseParameter;
  @override
  @JsonKey()
  List<int> get responseParameter {
    if (_responseParameter is EqualUnmodifiableListView)
      return _responseParameter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responseParameter);
  }

  @override
  String toString() {
    return 'OacpResponse(requestCode: $requestCode, resultCode: $resultCode, responseParameter: $responseParameter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OacpResponse &&
            (identical(other.requestCode, requestCode) ||
                other.requestCode == requestCode) &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            const DeepCollectionEquality()
                .equals(other._responseParameter, _responseParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestCode, resultCode,
      const DeepCollectionEquality().hash(_responseParameter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OacpResponseCopyWith<_$_OacpResponse> get copyWith =>
      __$$_OacpResponseCopyWithImpl<_$_OacpResponse>(this, _$identity);
}

abstract class _OacpResponse implements OacpResponse {
  const factory _OacpResponse(
      {required final int requestCode,
      required final int resultCode,
      final List<int> responseParameter}) = _$_OacpResponse;

  @override
  int get requestCode;
  @override
  int get resultCode;
  @override
  List<int> get responseParameter;
  @override
  @JsonKey(ignore: true)
  _$$_OacpResponseCopyWith<_$_OacpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
