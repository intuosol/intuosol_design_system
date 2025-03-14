import 'package:flutter/material.dart';

/// A widget that showcases the typography styles with the Oxanium font.
class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTypographyItem(
              context,
              'Display Large',
              textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            _buildTypographyItem(
              context,
              'Display Medium',
              textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            _buildTypographyItem(
              context,
              'Headline Large',
              textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            _buildTypographyItem(
              context,
              'Headline Medium',
              textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildTypographyItem(context, 'Title Large', textTheme.titleLarge),
            const SizedBox(height: 16),
            _buildTypographyItem(context, 'Body Large', textTheme.bodyLarge),
            const SizedBox(height: 16),
            _buildTypographyItem(context, 'Body Medium', textTheme.bodyMedium),
            const SizedBox(height: 16),
            _buildTypographyItem(context, 'Label Large', textTheme.labelLarge),
            const SizedBox(height: 16),
            _buildTypographyItem(context, 'Label Small', textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographyItem(
    BuildContext context,
    String title,
    TextStyle? style,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text('The quick brown fox jumps over the lazy dog', style: style),
        const SizedBox(height: 2),
        Text(
          style != null
              ? 'Size: ${style.fontSize?.toStringAsFixed(1)}px, Weight: ${style.fontWeight}'
              : 'Style not defined',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
