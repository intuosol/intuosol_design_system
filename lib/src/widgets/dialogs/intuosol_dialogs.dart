import 'package:flutter/material.dart';

import '../../../intuosol_design_system.dart';

/// A utility class that provides IntuoSol-branded dialog widgets.
///
/// This class contains static methods to display various dialogs with
/// IntuoSol branding.
class IntuoSolDialogs {
  /// Private constructor to prevent instantiation
  IntuoSolDialogs._();

  /// Displays a dialog with information about an IntuoSol package.
  ///
  /// This dialog shows the package name, description, and links to pub.dev
  /// and the IntuoSol website. It's designed for use in the "About" section
  /// of applications built with IntuoSol packages.
  ///
  /// [context] is the build context where the dialog will be shown.
  /// [packageName] is the name of the package to display, e.g. "intuosol_package".
  /// [description] is a brief description of the package.
  /// [pubDevLink] is the URL to the package on pub.dev.
  static void showAboutPackage({
    required BuildContext context,
    required String packageName,
    required String description,
  }) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
                spacing: 16.0,
                children: <Widget>[
                  IntuoSolLogos.appIcon(context: context, size: 70.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.0,
                    children: <Widget>[
                      Text(packageName.toCapitalCase()),
                      IntuoSolLogos.byIntuoSolText(context: context),
                    ],
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(color: Theme.of(context).colorScheme.outline),
                Text(description),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('View on pub.dev'),
                onPressed: () {
                  RedirectHandler.openPackage(packageName);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('IntuoSol.com'),
                onPressed: () {
                  RedirectHandler.openIntuosolWebsite();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }
}
