import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const EducaMaisApp());
}

/// Widget raiz do EducaMais.
///
/// A navegacao com `onGenerateRoute` e a tela de login entram nas fases
/// seguintes. Por enquanto o app so aplica o tema oficial e mostra a marca.
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
      home: const _EducaMaisPlaceholder(),
    );
  }
}

class _EducaMaisPlaceholder extends StatelessWidget {
  const _EducaMaisPlaceholder();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Text(
          'EducaMais',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontSize: 32,
              ),
        ),
      ),
    );
  }
}
