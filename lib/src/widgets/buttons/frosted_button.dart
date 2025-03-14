import 'dart:ui';

import 'package:flutter/material.dart';

/// A button with a frosted glass effect.
///
/// This component provides a visually distinctive button with a
/// frosted glass background that matches IntuoSol's design language.
class FrostedButton extends StatelessWidget {
  /// Creates a frosted glass button.
  ///
  /// The [onPressed] and [child] arguments must not be null.
  const FrostedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.antiAlias,
    this.statesController,
    this.blurAmount = 8.0,
    this.borderRadius = 16.0,
    this.foregroundColor,
    this.backgroundColor,
    this.padding,
    this.elevation,
  });

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// Called when a pointer enters or exits the button response area.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  final ButtonStyle? style;

  /// The widget below this widget in the tree.
  final Widget child;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Whether this widget should be focused automatically.
  final bool autofocus;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// A controller to coordinate animations with other interactive widgets.
  final WidgetStatesController? statesController;

  /// The amount of blur to apply to the background.
  final double blurAmount;

  /// The border radius of the button.
  final double borderRadius;

  /// The color to use for the button's text and icons.
  final Color? foregroundColor;

  /// The color to use for the button's background.
  final Color? backgroundColor;

  /// The padding around the button's child.
  final EdgeInsetsGeometry? padding;

  /// The elevation of the button.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Get the effective colors
    final Color effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.primaryContainer;

    final Color effectiveForegroundColor =
        foregroundColor ?? theme.colorScheme.onPrimaryContainer;

    // Create a transparent color with a slight opacity for the frosted effect
    final Color frostedColor = effectiveBackgroundColor.withValues(alpha: 0.4);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(frostedColor),
            foregroundColor: WidgetStateProperty.all(effectiveForegroundColor),
            elevation: WidgetStateProperty.all(elevation ?? 0),
            padding: padding != null ? WidgetStateProperty.all(padding) : null,
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ).merge(style),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          statesController: statesController,
          child: child,
        ),
      ),
    );
  }
}
