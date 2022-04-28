import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/screens/home/home.dart';
import 'package:flutter_newspaper_reading_app/screens/login/login.dart';

Widget Splash() {
  return AnimatedSplashScreen(
    splash: Column(
      children: [
        Text(
          'Break News',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.newspaper,
          size: 65,
        ),
      ],
    ),
    duration: 4000,
    nextScreen: LoginPage(),
    backgroundColor: Color(0xff34e2eb),
    splashIconSize: 100,
    splashTransition: SplashTransition.fadeTransition,
  );
}
