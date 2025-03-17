import 'package:flutter/material.dart';

/// Manages the app's theme state and provides methods to toggle between light and dark mode.
/// 
/// This class is integrated with IntuoSolApp to provide automatic theme switching support.
class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(this._themeMode);

  /// The current theme mode.
  ThemeMode _themeMode;

  /// Whether the application is in dark mode.
  bool get isDarkMode => themeMode == ThemeMode.dark;

  /// The current theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Sets the user's theme preference in shared preferences.
  void toggleThemeMode() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
