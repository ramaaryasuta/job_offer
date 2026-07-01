import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Duration _kWebTransitionDuration = Duration(milliseconds: 180);

/// Transisi fade tipis, mirip perilaku SPA (Single Page Application) modern.
/// Tidak ada slide, tidak ada scale — hanya opacity.
CustomTransitionPage<T> webFadePage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: _kWebTransitionDuration,
    reverseTransitionDuration: _kWebTransitionDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

/// Tanpa transisi sama sekali — persis seperti klik link HTML biasa.
/// Cocok untuk navigasi yang ingin terasa paling "native web".
CustomTransitionPage<T> instantPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    transitionsBuilder: (_, _, _, child) => child,
  );
}
