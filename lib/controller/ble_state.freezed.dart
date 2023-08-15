// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DiscoveredDevice> devices) scanning,
    required TResult Function(String deviceId) connecting,
    required TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)
        connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<DiscoveredDevice> devices)? scanning,
    TResult? Function(String deviceId)? connecting,
    TResult? Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DiscoveredDevice> devices)? scanning,
    TResult Function(String deviceId)? connecting,
    TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Scanning value) scanning,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(BleStateConnected value) connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Scanning value)? scanning,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(BleStateConnected value)? connected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Scanning value)? scanning,
    TResult Function(_Connecting value)? connecting,
    TResult Function(BleStateConnected value)? connected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BleStateCopyWith<$Res> {
  factory $BleStateCopyWith(BleState value, $Res Function(BleState) then) =
      _$BleStateCopyWithImpl<$Res, BleState>;
}

/// @nodoc
class _$BleStateCopyWithImpl<$Res, $Val extends BleState>
    implements $BleStateCopyWith<$Res> {
  _$BleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res> extends _$BleStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'BleState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DiscoveredDevice> devices) scanning,
    required TResult Function(String deviceId) connecting,
    required TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)
        connected,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<DiscoveredDevice> devices)? scanning,
    TResult? Function(String deviceId)? connecting,
    TResult? Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DiscoveredDevice> devices)? scanning,
    TResult Function(String deviceId)? connecting,
    TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Scanning value) scanning,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(BleStateConnected value) connected,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Scanning value)? scanning,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(BleStateConnected value)? connected,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Scanning value)? scanning,
    TResult Function(_Connecting value)? connecting,
    TResult Function(BleStateConnected value)? connected,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements BleState {
  const factory _Idle() = _$_Idle;
}

/// @nodoc
abstract class _$$_ScanningCopyWith<$Res> {
  factory _$$_ScanningCopyWith(
          _$_Scanning value, $Res Function(_$_Scanning) then) =
      __$$_ScanningCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiscoveredDevice> devices});
}

/// @nodoc
class __$$_ScanningCopyWithImpl<$Res>
    extends _$BleStateCopyWithImpl<$Res, _$_Scanning>
    implements _$$_ScanningCopyWith<$Res> {
  __$$_ScanningCopyWithImpl(
      _$_Scanning _value, $Res Function(_$_Scanning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$_Scanning(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
    ));
  }
}

/// @nodoc

class _$_Scanning implements _Scanning {
  const _$_Scanning({required final List<DiscoveredDevice> devices})
      : _devices = devices;

  final List<DiscoveredDevice> _devices;
  @override
  List<DiscoveredDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'BleState.scanning(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Scanning &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScanningCopyWith<_$_Scanning> get copyWith =>
      __$$_ScanningCopyWithImpl<_$_Scanning>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DiscoveredDevice> devices) scanning,
    required TResult Function(String deviceId) connecting,
    required TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)
        connected,
  }) {
    return scanning(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<DiscoveredDevice> devices)? scanning,
    TResult? Function(String deviceId)? connecting,
    TResult? Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
  }) {
    return scanning?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DiscoveredDevice> devices)? scanning,
    TResult Function(String deviceId)? connecting,
    TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Scanning value) scanning,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(BleStateConnected value) connected,
  }) {
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Scanning value)? scanning,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(BleStateConnected value)? connected,
  }) {
    return scanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Scanning value)? scanning,
    TResult Function(_Connecting value)? connecting,
    TResult Function(BleStateConnected value)? connected,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class _Scanning implements BleState {
  const factory _Scanning({required final List<DiscoveredDevice> devices}) =
      _$_Scanning;

  List<DiscoveredDevice> get devices;
  @JsonKey(ignore: true)
  _$$_ScanningCopyWith<_$_Scanning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectingCopyWith<$Res> {
  factory _$$_ConnectingCopyWith(
          _$_Connecting value, $Res Function(_$_Connecting) then) =
      __$$_ConnectingCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceId});
}

/// @nodoc
class __$$_ConnectingCopyWithImpl<$Res>
    extends _$BleStateCopyWithImpl<$Res, _$_Connecting>
    implements _$$_ConnectingCopyWith<$Res> {
  __$$_ConnectingCopyWithImpl(
      _$_Connecting _value, $Res Function(_$_Connecting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
  }) {
    return _then(_$_Connecting(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Connecting implements _Connecting {
  const _$_Connecting({required this.deviceId});

  @override
  final String deviceId;

  @override
  String toString() {
    return 'BleState.connecting(deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Connecting &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectingCopyWith<_$_Connecting> get copyWith =>
      __$$_ConnectingCopyWithImpl<_$_Connecting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DiscoveredDevice> devices) scanning,
    required TResult Function(String deviceId) connecting,
    required TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)
        connected,
  }) {
    return connecting(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<DiscoveredDevice> devices)? scanning,
    TResult? Function(String deviceId)? connecting,
    TResult? Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
  }) {
    return connecting?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DiscoveredDevice> devices)? scanning,
    TResult Function(String deviceId)? connecting,
    TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Scanning value) scanning,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(BleStateConnected value) connected,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Scanning value)? scanning,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(BleStateConnected value)? connected,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Scanning value)? scanning,
    TResult Function(_Connecting value)? connecting,
    TResult Function(BleStateConnected value)? connected,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements BleState {
  const factory _Connecting({required final String deviceId}) = _$_Connecting;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$_ConnectingCopyWith<_$_Connecting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BleStateConnectedCopyWith<$Res> {
  factory _$$BleStateConnectedCopyWith(
          _$BleStateConnected value, $Res Function(_$BleStateConnected) then) =
      __$$BleStateConnectedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String deviceId,
      String? lastMessage,
      List<ObjectMetaData> supportedUuids,
      bool loading});
}

/// @nodoc
class __$$BleStateConnectedCopyWithImpl<$Res>
    extends _$BleStateCopyWithImpl<$Res, _$BleStateConnected>
    implements _$$BleStateConnectedCopyWith<$Res> {
  __$$BleStateConnectedCopyWithImpl(
      _$BleStateConnected _value, $Res Function(_$BleStateConnected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? lastMessage = freezed,
    Object? supportedUuids = null,
    Object? loading = null,
  }) {
    return _then(_$BleStateConnected(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      supportedUuids: null == supportedUuids
          ? _value._supportedUuids
          : supportedUuids // ignore: cast_nullable_to_non_nullable
              as List<ObjectMetaData>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BleStateConnected implements BleStateConnected {
  const _$BleStateConnected(
      {required this.deviceId,
      required this.lastMessage,
      required final List<ObjectMetaData> supportedUuids,
      required this.loading})
      : _supportedUuids = supportedUuids;

  @override
  final String deviceId;
  @override
  final String? lastMessage;
  final List<ObjectMetaData> _supportedUuids;
  @override
  List<ObjectMetaData> get supportedUuids {
    if (_supportedUuids is EqualUnmodifiableListView) return _supportedUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedUuids);
  }

  @override
  final bool loading;

  @override
  String toString() {
    return 'BleState.connected(deviceId: $deviceId, lastMessage: $lastMessage, supportedUuids: $supportedUuids, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BleStateConnected &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality()
                .equals(other._supportedUuids, _supportedUuids) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, lastMessage,
      const DeepCollectionEquality().hash(_supportedUuids), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BleStateConnectedCopyWith<_$BleStateConnected> get copyWith =>
      __$$BleStateConnectedCopyWithImpl<_$BleStateConnected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DiscoveredDevice> devices) scanning,
    required TResult Function(String deviceId) connecting,
    required TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)
        connected,
  }) {
    return connected(deviceId, lastMessage, supportedUuids, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<DiscoveredDevice> devices)? scanning,
    TResult? Function(String deviceId)? connecting,
    TResult? Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
  }) {
    return connected?.call(deviceId, lastMessage, supportedUuids, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DiscoveredDevice> devices)? scanning,
    TResult Function(String deviceId)? connecting,
    TResult Function(String deviceId, String? lastMessage,
            List<ObjectMetaData> supportedUuids, bool loading)?
        connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(deviceId, lastMessage, supportedUuids, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Scanning value) scanning,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(BleStateConnected value) connected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Scanning value)? scanning,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(BleStateConnected value)? connected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Scanning value)? scanning,
    TResult Function(_Connecting value)? connecting,
    TResult Function(BleStateConnected value)? connected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class BleStateConnected implements BleState {
  const factory BleStateConnected(
      {required final String deviceId,
      required final String? lastMessage,
      required final List<ObjectMetaData> supportedUuids,
      required final bool loading}) = _$BleStateConnected;

  String get deviceId;
  String? get lastMessage;
  List<ObjectMetaData> get supportedUuids;
  bool get loading;
  @JsonKey(ignore: true)
  _$$BleStateConnectedCopyWith<_$BleStateConnected> get copyWith =>
      throw _privateConstructorUsedError;
}
