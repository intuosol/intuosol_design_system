import 'package:flutter/material.dart';

import '../../../intuosol_design_system.dart';

/// A collection of IntuoSol branded buttons.
///
/// This class provides factory methods for creating various button styles
/// that adhere to the IntuoSol design system guidelines.
class IntuoSolButtons {
  // Private constructor to prevent instantiation
  IntuoSolButtons._();

  /// Creates a floating action button that displays package information.
  ///
  /// This button shows the IntuoSol byline and opens an about dialog when pressed.
  /// It's designed to be used as a floating action button to showcase any
  /// package's information in a consistent way.
  ///
  /// Parameters:
  /// - [context] Required for theming and for showing the dialog.
  /// - [packageName] The name of the package to display in the about dialog, e.g. "intuosol_package".
  /// - [description] A brief description of the package.
  /// - [pubDevLink] Link to the package on pub.dev.
  static Widget floatingAboutPackage({
    required BuildContext context,
    required String packageName,
    required String description,
  }) => FrostedButton(
    style: ButtonStyle(shape: WidgetStateProperty.all(const StadiumBorder())),
    onPressed:
        () => IntuoSolDialogs.showAboutPackage(
          context: context,
          packageName: packageName,
          description: description,
        ),
    child: IntuoSolLogos.intuosolText(
      context: context,
      style: Theme.of(context).textTheme.labelMedium,
    ),
  );
}
