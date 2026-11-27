import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Indicator de încărcare reutilizabil.
class LoadingView extends StatelessWidget {
  const LoadingView({super.key, this.message = 'Se încarcă datele...'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: learningBlue),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ink, fontSize: 14),
            ),
            const SizedBox(height: 6),
            const Text(
              'Prima încărcare poate dura până la un minut,\n'
              'cât timp pornește serverul.',
              textAlign: TextAlign.center,
              style: TextStyle(color: muted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
