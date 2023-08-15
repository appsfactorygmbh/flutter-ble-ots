import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_state.freezed.dart';

@freezed
class BleState with _$BleState {
  const factory BleState.idle() = _Idle;
  const factory BleState.scanning({required List<DiscoveredDevice> devices}) = _Scanning;
  const factory BleState.connecting({required String deviceId}) = _Connecting;
  const factory BleState.connected({
    required String deviceId,
    required String? lastMessage,
    required List<ObjectMetaData> supportedUuids,
    required bool loading,
  }) = BleStateConnected;
}
