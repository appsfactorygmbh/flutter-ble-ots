import 'package:flutter_ble_ots_example/services/reactive_state.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleStatusMonitor implements ReactiveState<BleStatus?> {
  const BleStatusMonitor(this._ble);

  final FlutterReactiveBle _ble;

  @override
  Stream<BleStatus?> get state => _ble.statusStream;
}
