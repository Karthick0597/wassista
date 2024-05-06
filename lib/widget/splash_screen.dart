import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wasissta_project/ui%20design/welocmescreen.dart';
import 'package:wasissta_project/widget/constant.dart';
import 'package:wasissta_project/widget/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 800,
            splash: Text(
              "Wasissta",
              style: TextStyle(
                fontFamily: MyStrings.outfit,
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),

            nextScreen: const WelcomeScreen(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: whiteColor));
  }
}
