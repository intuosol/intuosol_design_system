/// IntuoSol Design System package
///
/// A Flutter design system package that provides IntuoSol's brand-consistent UI components,
/// theming, and logos, for building applications with a unified visual identity.
///
/// The main entry point for using this package is [IntuoSolApp], which applies the
/// IntuoSol design system automatically to your application.
///
/// Features:
/// - Complete Material 3 theming with IntuoSol's color palette
/// - Oxanium font from Google Fonts as the default typography
/// - IntuoSolApp and IntuoSolScaffold for easy integration
/// - Frosted glass UI components for a modern look
library intuosol_design_system;

// Core dependencies
export 'package:change_case/change_case.dart';

// Utilities
export 'src/core/services/redirect_handler.dart';
// Core theme
export 'src/theme/app_theme.dart';
// Main app wrapper and scaffold
export 'src/widgets/app/intuosol_app.dart';
// Components
export 'src/widgets/app_bar/frosted_app_bar.dart';
export 'src/widgets/buttons/frosted_button.dart';
export 'src/widgets/buttons/intuosol_buttons.dart';
export 'src/widgets/dialogs/intuosol_dialogs.dart';
export 'src/widgets/headers/intuosol_headers.dart';
export 'src/widgets/logos/intuosol_logos.dart';
