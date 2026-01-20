import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Uygulamanın tam tema tanımları.
class AppTheme {
  /// Aydınlık Tema (Light Theme)
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surface,
      onSurface: AppColors.charcoal,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.charcoal),
      titleTextStyle: TextStyle(
        color: AppColors.charcoal,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.textBody,
      displayColor: AppColors.charcoal,
      decorationColor: AppColors.accent,
    ),
    useMaterial3: true,
  );

  /// Karanlık Tema (Dark Theme)
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.accent,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textBodyDark,
      onPrimary: AppColors.backgroundDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textBodyDark),
      titleTextStyle: TextStyle(
        color: AppColors.textBodyDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.cardBorderDark),
      ),
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.textBodyDark,
      displayColor: AppColors.textBodyDark,
      decorationColor: AppColors.primaryDark,
    ),
    useMaterial3: true,
  );
}
