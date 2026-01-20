import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk paleti.
class AppColors {
  // Brand Colors (Light)
  static const Color primary = Color(0xFF2B2B2B);
  static const Color accent = Color(0xFFEE2B4B);
  static const Color offWhite = Color(0xFFFCFCFC);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color subtleGray = Color(0xFF71717A);
  static const Color cardBorder = Color(0xFFF1F1F1);

  // Additional UI Colors (Light)
  static const Color background = offWhite;
  static const Color surface = Colors.white;
  static const Color textBody = charcoal;
  static const Color textSecondary = subtleGray;

  // Dark Theme Colors (Based on the Dark design)
  static const Color primaryDark = Color(0xFFEE2B4B); // Same as accent in light
  static const Color backgroundDark = Color(0xFF000000);
  static const Color surfaceDark = Color(0xFF000000);
  static const Color cardBorderDark = Color(0x1AFFFFFF); // white/10 equivalent
  static const Color textBodyDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(
    0xFF94A3B8,
  ); // slate-400 equivalent
}
