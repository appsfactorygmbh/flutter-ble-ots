import 'package:flutter/material.dart';
import 'package:flutter_ble_ots/flutter_ble_ots.dart';
import 'package:flutter_ble_ots_example/controller/ble_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_text_button.dart';

class ConnectionPage extends HookConsumerWidget {
  final DiscoveredDevice device;
  const ConnectionPage({super.key, required this.device});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bleControllerProvider.notifier);
    final state = ref.watch(bleControllerProvider);
    final selectedUuid = useState<ObjectMetaData?>(null);

    final lastMessage = state.maybeMap(connected: (s) => s.lastMessage, orElse: () => null);
    final loading = state.maybeMap(connected: (s) => s.loading, orElse: () => false);
    final supportedUuids = state.maybeMap(connected: (s) => s.supportedUuids, orElse: () => null);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 1)).then(
        (_) => controller.connect(device),
      );
      return controller.disconnect;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection Page'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('connection state: ${state.runtimeType}'),
                if (supportedUuids != null)
                  ...supportedUuids
                      .map((uuid) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                  value: selectedUuid.value == uuid,
                                  onChanged: (value) {
                                    if (value == true) {
                                      selectedUuid.value = uuid;
                                    } else {
                                      selectedUuid.value = null;
                                    }
                                  }),
                              Text(uuid.name),
                            ],
                          ))
                      .toList(),
                if (selectedUuid.value != null)
                  AppTextButton(
                    onPressed: () => controller.readFromId(selectedUuid.value!.id),
                    text: 'Read Characteristic',
                  ),
                if (selectedUuid.value != null)
                  AppTextButton(
                    onPressed: () => controller.writeToId(selectedUuid.value!.id),
                    text: 'Write to Characteristic',
                  ),
                if (lastMessage != null) ...[
                  const Text('last message:'),
                  Text(lastMessage),
                ]
              ],
            ),
          ),
          if (loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
