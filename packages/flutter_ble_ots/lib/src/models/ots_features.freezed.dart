// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ots_features.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtsFeatures {
  OACPFeatures get oacpFeatures => throw _privateConstructorUsedError;
  OLCPFeatures get olcpFeatures => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtsFeaturesCopyWith<OtsFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtsFeaturesCopyWith<$Res> {
  factory $OtsFeaturesCopyWith(
          OtsFeatures value, $Res Function(OtsFeatures) then) =
      _$OtsFeaturesCopyWithImpl<$Res, OtsFeatures>;
  @useResult
  $Res call({OACPFeatures oacpFeatures, OLCPFeatures olcpFeatures});

  $OACPFeaturesCopyWith<$Res> get oacpFeatures;
  $OLCPFeaturesCopyWith<$Res> get olcpFeatures;
}

/// @nodoc
class _$OtsFeaturesCopyWithImpl<$Res, $Val extends OtsFeatures>
    implements $OtsFeaturesCopyWith<$Res> {
  _$OtsFeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oacpFeatures = null,
    Object? olcpFeatures = null,
  }) {
    return _then(_value.copyWith(
      oacpFeatures: null == oacpFeatures
          ? _value.oacpFeatures
          : oacpFeatures // ignore: cast_nullable_to_non_nullable
              as OACPFeatures,
      olcpFeatures: null == olcpFeatures
          ? _value.olcpFeatures
          : olcpFeatures // ignore: cast_nullable_to_non_nullable
              as OLCPFeatures,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OACPFeaturesCopyWith<$Res> get oacpFeatures {
    return $OACPFeaturesCopyWith<$Res>(_value.oacpFeatures, (value) {
      return _then(_value.copyWith(oacpFeatures: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OLCPFeaturesCopyWith<$Res> get olcpFeatures {
    return $OLCPFeaturesCopyWith<$Res>(_value.olcpFeatures, (value) {
      return _then(_value.copyWith(olcpFeatures: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OtsFeaturesCopyWith<$Res>
    implements $OtsFeaturesCopyWith<$Res> {
  factory _$$_OtsFeaturesCopyWith(
          _$_OtsFeatures value, $Res Function(_$_OtsFeatures) then) =
      __$$_OtsFeaturesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OACPFeatures oacpFeatures, OLCPFeatures olcpFeatures});

  @override
  $OACPFeaturesCopyWith<$Res> get oacpFeatures;
  @override
  $OLCPFeaturesCopyWith<$Res> get olcpFeatures;
}

/// @nodoc
class __$$_OtsFeaturesCopyWithImpl<$Res>
    extends _$OtsFeaturesCopyWithImpl<$Res, _$_OtsFeatures>
    implements _$$_OtsFeaturesCopyWith<$Res> {
  __$$_OtsFeaturesCopyWithImpl(
      _$_OtsFeatures _value, $Res Function(_$_OtsFeatures) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oacpFeatures = null,
    Object? olcpFeatures = null,
  }) {
    return _then(_$_OtsFeatures(
      oacpFeatures: null == oacpFeatures
          ? _value.oacpFeatures
          : oacpFeatures // ignore: cast_nullable_to_non_nullable
              as OACPFeatures,
      olcpFeatures: null == olcpFeatures
          ? _value.olcpFeatures
          : olcpFeatures // ignore: cast_nullable_to_non_nullable
              as OLCPFeatures,
    ));
  }
}

/// @nodoc

class _$_OtsFeatures implements _OtsFeatures {
  const _$_OtsFeatures(
      {required this.oacpFeatures, required this.olcpFeatures});

  @override
  final OACPFeatures oacpFeatures;
  @override
  final OLCPFeatures olcpFeatures;

  @override
  String toString() {
    return 'OtsFeatures(oacpFeatures: $oacpFeatures, olcpFeatures: $olcpFeatures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtsFeatures &&
            (identical(other.oacpFeatures, oacpFeatures) ||
                other.oacpFeatures == oacpFeatures) &&
            (identical(other.olcpFeatures, olcpFeatures) ||
                other.olcpFeatures == olcpFeatures));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oacpFeatures, olcpFeatures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtsFeaturesCopyWith<_$_OtsFeatures> get copyWith =>
      __$$_OtsFeaturesCopyWithImpl<_$_OtsFeatures>(this, _$identity);
}

abstract class _OtsFeatures implements OtsFeatures {
  const factory _OtsFeatures(
      {required final OACPFeatures oacpFeatures,
      required final OLCPFeatures olcpFeatures}) = _$_OtsFeatures;

  @override
  OACPFeatures get oacpFeatures;
  @override
  OLCPFeatures get olcpFeatures;
  @override
  @JsonKey(ignore: true)
  _$$_OtsFeaturesCopyWith<_$_OtsFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}
