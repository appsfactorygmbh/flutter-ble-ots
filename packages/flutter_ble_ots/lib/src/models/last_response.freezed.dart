// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LastResponse<Type> {
  DateTime get timeStamp => throw _privateConstructorUsedError;
  Type get response => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LastResponseCopyWith<Type, LastResponse<Type>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastResponseCopyWith<Type, $Res> {
  factory $LastResponseCopyWith(
          LastResponse<Type> value, $Res Function(LastResponse<Type>) then) =
      _$LastResponseCopyWithImpl<Type, $Res, LastResponse<Type>>;
  @useResult
  $Res call({DateTime timeStamp, Type response});
}

/// @nodoc
class _$LastResponseCopyWithImpl<Type, $Res, $Val extends LastResponse<Type>>
    implements $LastResponseCopyWith<Type, $Res> {
  _$LastResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = null,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Type,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LastResponseCopyWith<Type, $Res>
    implements $LastResponseCopyWith<Type, $Res> {
  factory _$$_LastResponseCopyWith(_$_LastResponse<Type> value,
          $Res Function(_$_LastResponse<Type>) then) =
      __$$_LastResponseCopyWithImpl<Type, $Res>;
  @override
  @useResult
  $Res call({DateTime timeStamp, Type response});
}

/// @nodoc
class __$$_LastResponseCopyWithImpl<Type, $Res>
    extends _$LastResponseCopyWithImpl<Type, $Res, _$_LastResponse<Type>>
    implements _$$_LastResponseCopyWith<Type, $Res> {
  __$$_LastResponseCopyWithImpl(
      _$_LastResponse<Type> _value, $Res Function(_$_LastResponse<Type>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = null,
    Object? response = freezed,
  }) {
    return _then(_$_LastResponse<Type>(
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$_LastResponse<Type> implements _LastResponse<Type> {
  _$_LastResponse({required this.timeStamp, required this.response});

  @override
  final DateTime timeStamp;
  @override
  final Type response;

  @override
  String toString() {
    return 'LastResponse<$Type>(timeStamp: $timeStamp, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastResponse<Type> &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timeStamp, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastResponseCopyWith<Type, _$_LastResponse<Type>> get copyWith =>
      __$$_LastResponseCopyWithImpl<Type, _$_LastResponse<Type>>(
          this, _$identity);
}

abstract class _LastResponse<Type> implements LastResponse<Type> {
  factory _LastResponse(
      {required final DateTime timeStamp,
      required final Type response}) = _$_LastResponse<Type>;

  @override
  DateTime get timeStamp;
  @override
  Type get response;
  @override
  @JsonKey(ignore: true)
  _$$_LastResponseCopyWith<Type, _$_LastResponse<Type>> get copyWith =>
      throw _privateConstructorUsedError;
}
