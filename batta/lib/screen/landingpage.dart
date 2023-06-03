import 'package:batta/screen/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BATTA',
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/image/splash.png'),
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
