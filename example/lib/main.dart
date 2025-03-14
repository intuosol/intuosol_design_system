import 'package:flutter/material.dart';
import 'package:intuosol_design_system/intuosol_design_system.dart';
import 'package:intuosol_design_system_example/widgets/image_table.dart';
import 'package:intuosol_design_system_example/widgets/typography_showcase.dart';

/// Example app demonstrating the IntuoSol Design System.
///
/// This app showcases the various components, themes, and utilities
/// provided by the IntuoSol Design System package.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using IntuoSolApp automatically applies the theme and
    // makes FrostedAppBar the default AppBar
    return IntuoSolApp(
      title: 'IntuoSol Design System Demo',
      // themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return IntuoSolScaffold(
      appBar: AppBar(
        title: IntuoSolLogos.intuosolText(context: context),
        forceMaterialTransparency: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    'IntuoSol Design System',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    'A Flutter package for incorporating the IntuoSol Design System into your Flutter app.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 24),
                const IntuoSolSectionHeader(title: 'IntuoSol Logos'),
                const SizedBox(height: 16),
                LogoTable(),
                const SizedBox(height: 48),
                const IntuoSolSectionHeader(
                  title: 'Typography with Oxanium Font',
                ),
                const SizedBox(height: 16),
                const TypographyShowcase(),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
      // Use FrostedFloatingActionButtonExtended directly for the frosted glass effect
      floatingActionButton: IntuoSolButtons.floatingAboutPackage(
        context: context,
        packageName: 'IntuoSol Design System',
        description:
            'A Flutter package for incorporating the IntuoSol Design System into your Flutter app.',
        pubDevLink: 'https://pub.dev/packages/intuosol_design_system',
      ),
    );
  }
}
