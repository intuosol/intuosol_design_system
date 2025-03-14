import 'package:url_launcher/url_launcher.dart';

/// A utility class for handling URL redirections.
class RedirectHandler {
  /// Private constructor to prevent instantiation
  RedirectHandler._();

  /// Opens the given [urlString] in the default browser or appropriate application.
  static Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  /// Opens the IntuoSol website in the default browser or appropriate application.
  static Future<void> openIntuosolWebsite() => openUrl('https://intuosol.com');

  /// Opens the package in pub.dev for the [packageName].
  static Future<void> openPackage(String packageName) =>
      openUrl('https://pub.dev/packages/$packageName');

  /// Opens the package documentation in pub.dev for the [packageName].
  static Future<void> openPackageDocumentation(String packageName) =>
      openUrl('https://pub.dev/documentation/$packageName');
}
