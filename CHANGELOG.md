## 0.3.0

### Added

- Added ThemeModeButton widget for toggling between light and dark themes
- Added ThemeNotifier to manage theme state throughout the app
- Integrated ThemeNotifier with IntuoSolApp for automatic theme switching

### Revised

- ThemeMode defaults to dark mode if no initial theme mode is provided

## 0.2.0

### Added

- Added URL redirection for IntuoSol website, pub.dev, and package documentation
- Added and exposed change_case package for case conversion

### Revised

- Exposed RedirectHandler class for handling URL redirection

### Fixed

- Fixed issue with IntuoSolSectionHeader text not scaling down to fit smaller screens

## 0.1.1

### Revised

- Revised the FrostedAppBar title and IntuoSolSectionHeader text to scale down to fit smaller screens

## 0.1.0

### Added

- Added FrostedButton widget with frosted glass effect
- Added FrostedAppBar widget with frosted glass background
- Integrated Oxanium font from Google Fonts as the default typography
- Enhanced component theming with consistent styles for AppBar, Card, and ListTile
- Added IntuoSolApp widget that streamlines app creation with the design system
- Added IntuoSolScaffold that automatically processes AppBars to use the FrostedAppBar

## 0.0.2

### Added

- New `IntuoSolButtons` class with `floatingAboutPackage` widget

## 0.0.1

Initial release of the IntuoSol Design System package.

### Features

- Material 3 themes with IntuoSol's brand colors (light and dark modes)
- IntuoSol logo widgets with different variants
- About package dialog with IntuoSol branding
