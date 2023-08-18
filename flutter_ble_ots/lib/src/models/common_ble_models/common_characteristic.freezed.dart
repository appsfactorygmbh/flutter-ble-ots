// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_characteristic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonCharacteristic {
  Uint8List get characteristicId => throw _privateConstructorUsedError;
  Uint8List get serviceId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonCharacteristicCopyWith<CommonCharacteristic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonCharacteristicCopyWith<$Res> {
  factory $CommonCharacteristicCopyWith(CommonCharacteristic value,
          $Res Function(CommonCharacteristic) then) =
      _$CommonCharacteristicCopyWithImpl<$Res, CommonCharacteristic>;
  @useResult
  $Res call({Uint8List characteristicId, Uint8List serviceId, String deviceId});
}

/// @nodoc
class _$CommonCharacteristicCopyWithImpl<$Res,
        $Val extends CommonCharacteristic>
    implements $CommonCharacteristicCopyWith<$Res> {
  _$CommonCharacteristicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristicId = null,
    Object? serviceId = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonCharacteristicCopyWith<$Res>
    implements $CommonCharacteristicCopyWith<$Res> {
  factory _$$_CommonCharacteristicCopyWith(_$_CommonCharacteristic value,
          $Res Function(_$_CommonCharacteristic) then) =
      __$$_CommonCharacteristicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List characteristicId, Uint8List serviceId, String deviceId});
}

/// @nodoc
class __$$_CommonCharacteristicCopyWithImpl<$Res>
    extends _$CommonCharacteristicCopyWithImpl<$Res, _$_CommonCharacteristic>
    implements _$$_CommonCharacteristicCopyWith<$Res> {
  __$$_CommonCharacteristicCopyWithImpl(_$_CommonCharacteristic _value,
      $Res Function(_$_CommonCharacteristic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characteristicId = null,
    Object? serviceId = null,
    Object? deviceId = null,
  }) {
    return _then(_$_CommonCharacteristic(
      characteristicId: null == characteristicId
          ? _value.characteristicId
          : characteristicId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommonCharacteristic implements _CommonCharacteristic {
  _$_CommonCharacteristic(
      {required this.characteristicId,
      required this.serviceId,
      required this.deviceId});

  @override
  final Uint8List characteristicId;
  @override
  final Uint8List serviceId;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'CommonCharacteristic(characteristicId: $characteristicId, serviceId: $serviceId, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonCharacteristic &&
            const DeepCollectionEquality()
                .equals(other.characteristicId, characteristicId) &&
            const DeepCollectionEquality().equals(other.serviceId, serviceId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(characteristicId),
      const DeepCollectionEquality().hash(serviceId),
      deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonCharacteristicCopyWith<_$_CommonCharacteristic> get copyWith =>
      __$$_CommonCharacteristicCopyWithImpl<_$_CommonCharacteristic>(
          this, _$identity);
}

abstract class _CommonCharacteristic implements CommonCharacteristic {
  factory _CommonCharacteristic(
      {required final Uint8List characteristicId,
      required final Uint8List serviceId,
      required final String deviceId}) = _$_CommonCharacteristic;

  @override
  Uint8List get characteristicId;
  @override
  Uint8List get serviceId;
  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_CommonCharacteristicCopyWith<_$_CommonCharacteristic> get copyWith =>
      throw _privateConstructorUsedError;
}
