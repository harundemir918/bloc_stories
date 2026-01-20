import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan renk paleti.
/// HTML/Tailwind tasarımından türetilmiştir.
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

  // Dark Theme Colors (Proposed based on brand colors)
  static const Color primaryDark = Color(0xFFE5E5E5);
  static const Color backgroundDark = Color(0xFF09090B);
  static const Color surfaceDark = Color(0xFF18181B);
  static const Color cardBorderDark = Color(0xFF27272A);
  static const Color textBodyDark = Color(0xFFF4F4F5);
  static const Color textSecondaryDark = Color(0xFFA1A1AA);
}
