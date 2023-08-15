import 'package:flutter/material.dart';
import 'package:flutter_ble_ots_example/controller/ble_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/providers.dart';
import 'app_text_button.dart';
import 'connection_page.dart';

class ScanPage extends HookConsumerWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bleControllerProvider.notifier);
    final state = ref.watch(bleControllerProvider);
    final bleStatus = ref.watch(bleStatusProvider).value;

    useEffect(() {
      Future.delayed(const Duration(seconds: 1)).then(
        (_) => controller.startScan(),
      );
      return controller.stopScan;
    }, const []);

    final showScanButton = state.maybeWhen(scanning: (_) => true, idle: () => true, orElse: () => false);

    final scannedDeviced = state.maybeWhen(scanning: (devices) => devices, orElse: () => null);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scanner'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('ble status $bleStatus'),
              if (showScanButton)
                AppTextButton(
                    onPressed: () {
                      state.maybeWhen(
                          scanning: (_) {
                            controller.stopScan();
                          },
                          idle: () {
                            controller.startScan();
                          },
                          orElse: () {});
                    },
                    text: state.maybeWhen(scanning: (_) => 'Stop Scan', idle: () => 'Start Scan', orElse: () => '')),
              if (scannedDeviced == null)
                const Text('Scan is stopped')
              else
                Column(
                    children: scannedDeviced
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [const Text('id'), Expanded(child: Text(e.id, textAlign: TextAlign.end))]),
                                        const SizedBox(height: 10),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [const Text('name'), Expanded(child: Text(e.name, textAlign: TextAlign.end))])
                                      ],
                                    ),
                                  ),
                                ),
                                AppTextButton(
                                    onPressed: () {
                                      controller.stopScan();
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConnectionPage(device: e)));
                                    },
                                    text: 'connect'),
                              ],
                            ))
                        .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
