import 'package:flutter/material.dart';

import 'navigation/app_navigation.dart';
import 'navigation/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EducaMaisApp());
}

/// Widget raiz do EducaMais.
///
/// A navegacao usa `onGenerateRoute` com [AppNavigation.generateRoute] —
/// nada de `routes: {}` no MaterialApp.
class EducaMaisApp extends StatelessWidget {
  const EducaMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EducaMais',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
