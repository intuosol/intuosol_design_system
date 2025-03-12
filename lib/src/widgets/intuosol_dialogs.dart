import 'package:flutter/material.dart';

import '../../intuosol_design_system.dart';
import '../services/redirect_handler.dart';

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
  /// [packageName] is the name of the package to display.
  /// [description] is a brief description of the package.
  /// [pubDevLink] is the URL to the package on pub.dev.
  static void showAboutPackage({
    required BuildContext context,
    required String packageName,
    required String description,
    required String pubDevLink,
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
                      Text(packageName),
                      IntuoSolLogos.byIntuoSol(context: context),
                    ],
                  ),
                ],
              ),
            ),
            content: Text(description),
            actions: <Widget>[
              TextButton(
                child: const Text('View on pub.dev'),
                onPressed: () => RedirectHandler.openUrl(pubDevLink),
              ),
              TextButton(
                child: const Text('IntuoSol.com'),
                onPressed:
                    () => RedirectHandler.openUrl('https://intuosol.com'),
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
