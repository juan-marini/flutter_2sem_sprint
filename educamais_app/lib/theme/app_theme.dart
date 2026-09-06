import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tema visual do EducaMais: cantos arredondados, borda fina e paleta
/// navy/azul/ciano definida em [AppColors].
class AppTheme {
  AppTheme._();

  static final ColorScheme _lightColors = ColorScheme.fromSeed(
    seedColor: AppColors.azulEletrico,
    brightness: Brightness.light,
    primary: AppColors.azulEletrico,
    secondary: AppColors.ciano,
    surface: AppColors.superficieClara,
    error: AppColors.risco,
  );

  static final ColorScheme _darkColors = ColorScheme.fromSeed(
    seedColor: AppColors.azulEletrico,
    brightness: Brightness.dark,
    primary: AppColors.azulEletrico,
    secondary: AppColors.ciano,
    surface: AppColors.navy,
    error: AppColors.risco,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColors,
    scaffoldBackgroundColor: AppColors.fundoClaro,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    dividerColor: AppColors.divisorClaro,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColors,
    scaffoldBackgroundColor: AppColors.navy,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    dividerColor: AppColors.divisorClaro,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
    ),
  );
}
