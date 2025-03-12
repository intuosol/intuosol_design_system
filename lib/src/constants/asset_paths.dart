/// A utility class that provides path constants for assets used in the package.
///
/// This class contains static getters for accessing various logo assets
/// to ensure consistent referencing throughout the codebase.
class AssetPaths {
  /// Private constructor to prevent instantiation
  AssetPaths._();
  
  /// Base path for all logo assets
  static const String baseLogoPath = 'assets/logos/';

  /// Path to the app icon asset
  static String get appIcon => '${baseLogoPath}app_icon.png';
  
  /// Path to the light version of the logo
  static String get logoLight => '${baseLogoPath}light.png';
  
  /// Path to the dark version of the logo
  static String get logoDark => '${baseLogoPath}dark.png';
  
  /// Path to the light version of the square logo
  static String get squareLogoLight => '${baseLogoPath}square_light.png';
  
  /// Path to the dark version of the square logo
  static String get squareLogoDark => '${baseLogoPath}square_dark.png';
  
  /// Path to the text-only logo
  static String get textLogo => '${baseLogoPath}text.png';
  
  /// Path to the "by IntuoSol" attribution logo
  static String get byIntuoSol => '${baseLogoPath}by_intuosol.png';
}
