import 'package:flutter/material.dart';

import '../../state/view_state.dart';
import 'error_view.dart';
import 'loading_view.dart';

/// Widget reutilizabil care alege ce se afișează în funcție de [ViewState]:
/// loader, eroare cu „Reîncearcă” sau conținutul construit de [builder].
class StateView<T> extends StatelessWidget {
  const StateView({
    super.key,
    required this.state,
    required this.builder,
    required this.onRetry,
    this.background = Colors.white,
  });

  final ViewState<T> state;
  final Widget Function(T data) builder;
  final VoidCallback onRetry;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      LoadingState<T>() => Scaffold(
          backgroundColor: background,
          body: const LoadingView(),
        ),
      ErrorState<T>(:final message) => Scaffold(
          backgroundColor: background,
          body: ErrorView(message: message, onRetry: onRetry),
        ),
      ContentState<T>(:final data) => builder(data),
    };
  }
}
