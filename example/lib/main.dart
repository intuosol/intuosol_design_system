import 'package:flutter/material.dart';
import 'package:intuosol_design_system/intuosol_design_system.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: IntuoSolTheme.darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            spacing: 24.0,
            children: [
              IntuoSolLogos.logo(context: context, width: 350.0),
              IntuoSolLogos.squareLogo(context: context, size: 200.0),
              IntuoSolLogos.appIcon(context: context, size: 200.0),
            ],
          ),
        ),
      ),
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
