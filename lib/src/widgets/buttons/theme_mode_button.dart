import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_notifier.dart';

/// An icon button that toggles between light and dark theme modes.
/// 
/// Automatically updates the UI based on the current theme through ThemeNotifier.
class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ThemeNotifier>(
        builder:
            (
              BuildContext context,
              ThemeNotifier themeNotifier,
              Widget? child,
            ) => IconButton(
              tooltip: 'Toggle Brightness',
              icon: Icon(
                themeNotifier.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: themeNotifier.toggleThemeMode,
            ),
      ),
    );
  }
}
