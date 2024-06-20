import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wasissta_project/widget/constant.dart';

import '../ui design/welocmescreen.dart';

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
      home: Scaffold(
        body: AnimatedSplashScreen(
          duration: 2000,
          splash: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width / 1.6,
              child: Lottie.asset(
                "asset/json_data/2x.json",
                fit: BoxFit.cover,
              ),
            ),
          ),
          nextScreen: const WelcomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white70,
        ),
      ),
    );
  }
}
