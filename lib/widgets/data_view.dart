import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

/// Afișează un loader cât timp JSON-ul se încarcă, un mesaj de eroare dacă
/// încărcarea a eșuat, altfel construiește ecranul cu datele din controller.
class DataView extends GetView<AppController> {
  const DataView({super.key, required this.builder, this.background});

  final Widget Function(AppController c) builder;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: background,
          body: const Center(child: CircularProgressIndicator()),
        );
      }
      if (controller.error.value != null || controller.data.value == null) {
        return Scaffold(
          backgroundColor: background,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.error.value ?? 'Nu există date.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.loadData,
                    child: const Text('Reîncearcă'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return builder(controller);
    });
  }
}
