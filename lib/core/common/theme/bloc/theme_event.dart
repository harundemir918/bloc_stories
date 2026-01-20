import 'package:flutter/material.dart';

abstract class ThemeEvent {}

/// Tema değişimi tetikleyen olay.
class ThemeToggled extends ThemeEvent {}

/// Manuel tema seçimi.
class ThemeChanged extends ThemeEvent {
  final ThemeMode themeMode;
  ThemeChanged(this.themeMode);
}
