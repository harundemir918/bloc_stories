import 'package:flutter/material.dart';

abstract class ThemeEvent {}

/// Tema değişimi tetikleyen olay.
class ToggleThemeEvent extends ThemeEvent {}

/// Manuel tema seçimi.
class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  ChangeThemeEvent(this.themeMode);
}
