import 'package:flutter/material.dart';

/// A stylized section header with a vertical accent bar and underline
class IntuoSolSectionHeader extends StatelessWidget {
  /// Creates a stylized section header with accent bar and underline
  const IntuoSolSectionHeader({
    super.key,
    required this.title,
    this.textStyle,
    this.accentColor,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  });

  /// The title text to display in the header
  final String title;

  /// Optional custom text style to override the default
  final TextStyle? textStyle;

  /// Optional accent color (uses primary color by default)
  final Color? accentColor;

  /// Optional padding for the header
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor =
        accentColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: primaryColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(width: 12.0, height: 24.0, color: primaryColor),
          const SizedBox(width: 12.0),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: textStyle ?? Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
