import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../app_bar/frosted_app_bar.dart';

/// A Material App that automatically applies IntuoSol's design system.
///
/// This is the recommended way to build IntuoSol apps. It automatically:
/// - Applies the IntuoSol theme
/// - Uses FrostedAppBar as the default AppBar
/// - Provides consistent styling across all IntuoSol apps
class IntuoSolApp extends StatelessWidget {
  /// Creates an IntuoSol-themed application.
  ///
  /// Most parameters are the same as those in [MaterialApp].
  const IntuoSolApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.theme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = false,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  });

  /// {@macro flutter.widgets.navigator.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// {@macro flutter.material.materialApp.home}
  final Widget? home;

  /// {@macro flutter.material.materialApp.routes}
  final Map<String, WidgetBuilder> routes;

  /// {@macro flutter.material.materialApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.material.materialApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.material.materialApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.material.materialApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.material.materialApp.navigatorObservers}
  final List<NavigatorObserver> navigatorObservers;

  /// {@macro flutter.material.materialApp.builder}
  final TransitionBuilder? builder;

  /// {@macro flutter.material.materialApp.title}
  final String title;

  /// {@macro flutter.material.materialApp.onGenerateTitle}
  final GenerateAppTitle? onGenerateTitle;

  /// Optional custom theme - if not provided, IntuoSolTheme will be used
  final ThemeData? theme;

  /// {@macro flutter.material.materialApp.themeMode}
  final ThemeMode themeMode;

  /// {@macro flutter.material.materialApp.locale}
  final Locale? locale;

  /// {@macro flutter.material.materialApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.material.materialApp.localeListResolutionCallback}
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.material.materialApp.localeResolutionCallback}
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.material.materialApp.supportedLocales}
  final Iterable<Locale> supportedLocales;

  /// {@macro flutter.material.materialApp.debugShowMaterialGrid}
  final bool debugShowMaterialGrid;

  /// {@macro flutter.material.materialApp.showPerformanceOverlay}
  final bool showPerformanceOverlay;

  /// {@macro flutter.material.materialApp.checkerboardRasterCacheImages}
  final bool checkerboardRasterCacheImages;

  /// {@macro flutter.material.materialApp.checkerboardOffscreenLayers}
  final bool checkerboardOffscreenLayers;

  /// {@macro flutter.material.materialApp.showSemanticsDebugger}
  final bool showSemanticsDebugger;

  /// {@macro flutter.material.materialApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.material.materialApp.shortcuts}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// {@macro flutter.material.materialApp.actions}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.material.materialApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@macro flutter.material.materialApp.scrollBehavior}
  final ScrollBehavior? scrollBehavior;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: (context, child) {
        // Apply the custom builder if provided
        Widget result = child ?? const SizedBox.shrink();
        if (builder != null) {
          result = builder!(context, result);
        }

        // Apply AppBar style injection through a scope that will be detected
        return AppBarOverrideScope(child: _ScaffoldInterceptor(child: result));
      },
      title: title,
      onGenerateTitle: onGenerateTitle,
      // Use provided theme or default to IntuoSolTheme
      theme: theme ?? IntuoSolTheme.lightTheme,
      darkTheme: IntuoSolTheme.darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
    );
  }
}

/// A scope that marks descendant AppBars to be converted to FrostedAppBars
class AppBarOverrideScope extends InheritedWidget {
  const AppBarOverrideScope({super.key, required super.child});

  @override
  bool updateShouldNotify(AppBarOverrideScope oldWidget) => false;

  /// Indicates whether an AppBar should be converted to a FrostedAppBar.
  static bool shouldOverrideAppBar(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppBarOverrideScope>() !=
        null;
  }
}

/// A widget that intercepts Scaffold builds and replaces their AppBars with FrostedAppBars
class _ScaffoldInterceptor extends StatelessWidget {
  const _ScaffoldInterceptor({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _ScaffoldInterceptorScope(child: child);
  }
}

/// A build scope that intercepts and modifies Scaffold widgets
class _ScaffoldInterceptorScope extends StatelessWidget {
  const _ScaffoldInterceptorScope({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return child;
      },
    );
  }
}

/// Custom Scaffold class that automatically uses FrostedAppBar
class IntuoSolScaffold extends StatelessWidget {
  /// Creates a scaffold with automatic FrostedAppBar support.
  const IntuoSolScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  /// The app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// A button displayed floating above [body], in the bottom right corner.
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  final List<Widget>? persistentFooterButtons;

  /// The alignment of the [persistentFooterButtons] within the [OverflowBar].
  final AlignmentDirectional persistentFooterAlignment;

  /// A panel displayed to the side of the [body], often hidden on mobile devices.
  final Widget? drawer;

  /// Called when the drawer is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the [body], often hidden on mobile devices.
  final Widget? endDrawer;

  /// Called when the end drawer is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// The widget to display at the bottom of the scaffold.
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  final Widget? bottomSheet;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  final Color? backgroundColor;

  /// Whether the body should resize when the keyboard appears.
  final bool? resizeToAvoidBottomInset;

  /// Whether to show the [appBar] or not.
  final bool primary;

  /// The behavior when opening the drawer.
  final DragStartBehavior drawerDragStartBehavior;

  /// Whether the [body] should extend behind the [bottomNavigationBar].
  final bool extendBody;

  /// Whether the [body] should extend behind the [appBar].
  final bool extendBodyBehindAppBar;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  final Color? drawerScrimColor;

  /// The width of the gesture detection area on the edge of the screen.
  final double? drawerEdgeDragWidth;

  /// Whether to enable the drag gesture to open the drawer.
  final bool drawerEnableOpenDragGesture;

  /// Whether to enable the drag gesture to open the end drawer.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the [Scaffold].
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    // Process AppBar if appropriate
    PreferredSizeWidget? processedAppBar = appBar;
    if (appBar is AppBar) {
      processedAppBar = (appBar! as AppBar).asFrostedIfNeeded(context);
    }

    return Scaffold(
      key: key,
      appBar: processedAppBar,
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
