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
}
