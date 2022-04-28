import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/emotion/splashscreen.dart';
import 'package:flutter_newspaper_reading_app/screens/login/login.dart';
import 'package:flutter_newspaper_reading_app/screens/register/register.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
    title: 'Newspaper Reading',
  ));
}
