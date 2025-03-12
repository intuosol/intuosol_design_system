import 'package:flutter/material.dart';

import '../constants/asset_paths.dart';

/// A utility class that provides IntuoSol logo widgets.
///
/// This class contains static methods to display various IntuoSol logos
/// with customizable parameters like size, light/dark mode, etc. All logos
/// are sourced from the package's asset bundle.
class IntuoSolLogos {
  /// Private constructor to prevent instantiation
  IntuoSolLogos._();

  /// Displays the "by IntuoSol" text logo.
  ///
  /// This logo is typically used in footers or attribution sections.
  ///
  /// [context] is used to get the default text style if none provided.
  /// [style] can be provided to customize the text appearance.
  static Widget byIntuoSol({required BuildContext context, TextStyle? style}) {
    style ??= Theme.of(context).textTheme.titleMedium!;
    return Image.asset(
      AssetPaths.byIntuoSol,
      height: style.fontSize,
      color: style.color,
      package: 'intuosol_design_system',
    );
  }

  /// Displays the standard IntuoSol logo.
  ///
  /// This is the main logo used for branding and app headers.
  ///
  /// [context] is used to determine the default theme mode.
  /// [dark] can override the theme mode detection if specified.
  /// [height] sets the height of the logo.
  /// [width] sets the width of the logo.
  static Widget logo({
    required BuildContext context,
    bool? dark,
    double? height,
    double? width,
  }) {
    dark ??= Theme.of(context).brightness == Brightness.light;
    return Image.asset(
      dark ? AssetPaths.logoDark : AssetPaths.logoLight,
      height: height,
      width: width,
      package: 'intuosol_design_system',
    );
  }

  /// Displays the square-formatted IntuoSol logo.
  ///
  /// This variant of the logo fits in square spaces and is used
  /// for icons and places where horizontal space is limited.
  ///
  /// [context] is used to determine the default theme mode.
  /// [dark] can override the theme mode detection if specified.
  /// [size] sets both the height and width of the logo.
  static Widget squareLogo({
    required BuildContext context,
    bool? dark,
    double? size,
  }) {
    dark ??= Theme.of(context).brightness == Brightness.light;
    return Image.asset(
      dark ? AssetPaths.squareLogoDark : AssetPaths.squareLogoLight,
      height: size,
      package: 'intuosol_design_system',
    );
  }

  /// Displays the IntuoSol app icon.
  ///
  /// This icon is used for app launchers and represents IntuoSol applications.
  ///
  /// [context] is required for widget tree integration.
  /// [size] sets both the height and width of the icon.
  static Widget appIcon({required BuildContext context, double? size}) =>
      Image.asset(
        AssetPaths.appIcon,
        height: size,
        package: 'intuosol_design_system',
      );
}
