import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that provides IntuoSol's brand-consistent Material themes.
///
/// This class provides static access to the light and dark themes
/// that conform to IntuoSol's design standards.
///
/// Features include:
/// - Oxanium font from Google Fonts as the default typography
/// - Custom color schemes for light and dark modes
/// - Consistent component theming
class IntuoSolTheme {
  // Private constructor to prevent instantiation
  IntuoSolTheme._();

  /// Creates component themes based on colors from the color scheme
  static ThemeData _applyComponentThemes({required ThemeData baseTheme}) {
    final ColorScheme colorScheme = baseTheme.colorScheme;
    final bool isDarkMode = baseTheme.brightness == Brightness.dark;
    return baseTheme.copyWith(
      // AppBar theme
      appBarTheme: AppBarTheme(backgroundColor: colorScheme.inversePrimary),

      // Card theme
      cardTheme: CardTheme(
        color: Color.alphaBlend(
          colorScheme.surfaceTint.withValues(alpha: isDarkMode ? 0.07 : 0.03),
          colorScheme.surface,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // ListTile theme
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: colorScheme.inverseSurface.withValues(
          alpha: isDarkMode ? 0.02 : 0.05,
        ),
      ),
    );
  }

  /// The dark theme for IntuoSol applications.
  ///
  /// Features a dark color palette with green accents that maintain
  /// the IntuoSol brand identity while providing optimal contrast
  /// for dark mode environments.
  ///
  /// Includes the Oxanium font from Google Fonts for a modern,
  /// tech-forward appearance.
  static final ThemeData darkTheme = _applyComponentThemes(
    baseTheme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: GoogleFonts.oxaniumTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff9ad4a1),
        onPrimary: Color(0xff003916),
        primaryContainer: Color(0xff1a512a),
        onPrimaryContainer: Color(0xffb5f1bc),
        secondary: Color(0xffb7ccb6),
        onSecondary: Color(0xff233425),
        secondaryContainer: Color(0xff394b3b),
        onSecondaryContainer: Color(0xffd3e8d2),
        tertiary: Color(0xffa1ced8),
        onTertiary: Color(0xff00363e),
        tertiaryContainer: Color(0xff204d55),
        onTertiaryContainer: Color(0xffbdeaf4),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff101510),
        onSurface: Color(0xffdfe4dc),
        surfaceTint: Color(0xff9ad4a1),
        outline: Color(0xff8b9389),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffdfe4dc),
        onInverseSurface: Color(0xff2d322c),
        inversePrimary: Color(0xff336940),
      ),
    ),
  );

  /// The light theme for IntuoSol applications.
  ///
  /// Features a light color palette with green accents that reflect
  /// the IntuoSol brand identity while providing a clean, professional
  /// appearance for day-to-day use.
  ///
  /// Includes the Oxanium font from Google Fonts for a modern,
  /// tech-forward appearance.
  static final ThemeData lightTheme = _applyComponentThemes(
    baseTheme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFE5E5E5),
      textTheme: GoogleFonts.oxaniumTextTheme(ThemeData.light().textTheme),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff336940),
        surfaceTint: Color(0xff336940),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffb5f1bc),
        onPrimaryContainer: Color(0xff00210a),
        secondary: Color(0xff506351),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd3e8d2),
        onSecondaryContainer: Color(0xff0e1f11),
        tertiary: Color(0xff39656d),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffbdeaf4),
        onTertiaryContainer: Color(0xff001f25),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfff6fbf2),
        onSurface: Color(0xff181d18),
        onSurfaceVariant: Color(0xff414941),
        outline: Color(0xff727970),
        outlineVariant: Color(0xffc1c9be),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2d322c),
        inversePrimary: Color(0xff9ad4a1),
        primaryFixed: Color(0xffb5f1bc),
        onPrimaryFixed: Color(0xff00210a),
        primaryFixedDim: Color(0xff9ad4a1),
        onPrimaryFixedVariant: Color(0xff1a512a),
        secondaryFixed: Color(0xffd3e8d2),
        onSecondaryFixed: Color(0xff0e1f11),
        secondaryFixedDim: Color(0xffb7ccb6),
        onSecondaryFixedVariant: Color(0xff394b3b),
        tertiaryFixed: Color(0xffbdeaf4),
        onTertiaryFixed: Color(0xff001f25),
        tertiaryFixedDim: Color(0xffa1ced8),
        onTertiaryFixedVariant: Color(0xff204d55),
        surfaceDim: Color(0xffd7dbd3),
        surfaceBright: Color(0xfff6fbf2),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff1f5ed),
        surfaceContainer: Color(0xffebefe7),
        surfaceContainerHigh: Color(0xffe5eae1),
        surfaceContainerHighest: Color(0xffdfe4dc),
      ),
    ),
  );
}
