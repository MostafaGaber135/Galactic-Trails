import 'package:flutter/material.dart';
import 'package:galactic_trails/widgets/splash_screen.dart';

void main() {
  runApp(const GalacticTrails());
}

class GalacticTrails extends StatelessWidget {
  const GalacticTrails({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
