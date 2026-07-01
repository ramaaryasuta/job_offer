import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/routing/app_router.dart';
import 'core/themes/app_theme.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    usePathUrlStrategy();

    runApp(const MainApp());
  }, (e, s) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Job Offer',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

      /// Setup [themeMode] to dynamic value if already support dark mode
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
