import 'dart:ui';

import 'package:flutter/material.dart';
import '../app/intuosol_app.dart';

/// A frosted glass-style AppBar that implements PreferredSizeWidget.
///
/// This AppBar has a frosted glass background effect and is designed to be used
/// as the primary AppBar in IntuoSol design system applications.
class FrostedAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a frosted glass AppBar.
  ///
  /// The [title] argument must not be null.
  const FrostedAppBar({
    super.key,
    required this.title,
    this.actions,
    this.transparent = true,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.titleSpacing,
    this.centerTitle,
    this.titleTextStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.excludeHeaderSemantics = false,
  });

  /// The primary widget displayed in the app bar.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// screen.
  final Widget title;

  /// Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  final List<Widget>? actions;

  /// Whether to make the AppBar transparent.
  ///
  /// If true, the AppBar will not have a background color.
  final bool transparent;

  /// A widget to display before the title.
  ///
  /// Typically a [BackButton] or an [IconButton] with a menu icon.
  final Widget? leading;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// Whether the leading widget should be automatically implied.
  final bool automaticallyImplyLeading;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar].
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar when it is not scrolled
  /// under.
  final double? elevation;

  /// The elevation overlay color used to indicate elevation for this [AppBar].
  final double? scrolledUnderElevation;

  /// The spacing around [title] content on the horizontal axis.
  final double? titleSpacing;

  /// The default text style for the AppBar's [title] widget.
  final TextStyle? titleTextStyle;

  /// The color to use for the app bar's background.
  final Color? backgroundColor;

  /// The default color for [title]'s, [action]'s and [leading] widget.
  final Color? foregroundColor;

  /// The size, opacity, and color of the icon in the app bar.
  final IconThemeData? iconTheme;

  /// The size, opacity, and color of the icon in the action part of the app bar.
  final IconThemeData? actionsIconTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  final bool primary;

  /// Defines the height of the toolbar component of an [AppBar].
  final double? toolbarHeight;

  /// Defines the width of [leading] widget.
  final double? leadingWidth;

  /// The default style for [Widget]s in the app bar.
  final TextStyle? toolbarTextStyle;

  /// The color of the shadow below the app bar.
  final Color? shadowColor;

  /// The color of the surface tint overlay applied to the app bar's background.
  final Color? surfaceTintColor;

  /// The shape of the app bar's [Material].
  final ShapeBorder? shape;

  /// Whether the title should be wrapped with header [Semantics].
  final bool excludeHeaderSemantics;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color? effectiveBackgroundColor =
        backgroundColor ??
        (transparent ? Colors.transparent : theme.appBarTheme.backgroundColor);

    return Material(
      elevation: elevation ?? 3,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: AppBar(
                title: title,
                actions: actions,
                leading: leading,
                automaticallyImplyLeading: automaticallyImplyLeading,
                centerTitle: centerTitle,
                backgroundColor: effectiveBackgroundColor,
                foregroundColor: foregroundColor,
                iconTheme: iconTheme,
                actionsIconTheme: actionsIconTheme,
                primary: primary,
                toolbarHeight: toolbarHeight,
                leadingWidth: leadingWidth,
                titleSpacing: titleSpacing,
                titleTextStyle: titleTextStyle,
                toolbarTextStyle: toolbarTextStyle,
                bottom: bottom,
                elevation: 0,
                scrolledUnderElevation: 0,
                excludeHeaderSemantics: excludeHeaderSemantics,
                forceMaterialTransparency: transparent,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
          if (transparent) const Divider(height: 0, thickness: 0.3),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
  );
}

/// Extensions to automatically convert an AppBar to a FrostedAppBar when used
/// within an IntuoSolApp.
extension AppBarExtensions on AppBar {
  /// Returns a FrostedAppBar if the context has an _AppBarOverrideScope,
  /// otherwise returns this AppBar unchanged.
  PreferredSizeWidget asFrostedIfNeeded(BuildContext context) {
    if (!AppBarOverrideScope.shouldOverrideAppBar(context)) {
      return this;
    }

    return FrostedAppBar(
      key: key,
      title: title ?? const Text(''),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      titleTextStyle: titleTextStyle,
      toolbarTextStyle: toolbarTextStyle,
      bottom: bottom,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      shadowColor: shadowColor,
      shape: shape,
    );
  }
}

/// Extension on Scaffold to automatically apply FrostedAppBar
extension ScaffoldExtensions on Scaffold {
  /// Returns a new Scaffold with the appBar converted to FrostedAppBar if
  /// needed based on the context.
  Scaffold withFrostedAppBarIfNeeded(BuildContext context) {
    // If there's no app bar or it's not an AppBar, return unchanged
    if (appBar == null || appBar is! AppBar) {
      return this;
    }

    // Convert the AppBar to FrostedAppBar if needed
    final PreferredSizeWidget convertedAppBar = (appBar! as AppBar)
        .asFrostedIfNeeded(context);

    // If no conversion happened, return unchanged
    if (convertedAppBar == appBar) {
      return this;
    }

    // Return a new Scaffold with the converted AppBar
    return Scaffold(
      key: key,
      appBar: convertedAppBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
  }
}

/// A builder that automatically converts AppBars to FrostedAppBars
/// when used within an IntuoSolApp.
class ScaffoldBuilder extends StatelessWidget {
  /// Creates a scaffold builder that automatically applies FrostedAppBars.
  ///
  /// The [builder] argument must not be null.
  const ScaffoldBuilder({super.key, required this.builder});

  /// Builder function that creates the scaffold
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final Widget scaffold = builder(context);
        if (scaffold is Scaffold) {
          return scaffold.withFrostedAppBarIfNeeded(context);
        }
        return scaffold;
      },
    );
  }
}
