import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:storish/screens/splash/login/login.dart';
import 'package:storish/screens/splash/login/signup.dart';
import 'package:storish/screens/splash/splash_screen.dart';

import 'package:storish/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxcam.startWithKey("dbt7wqyvjxv74iu");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen(),
      home: SignUp(),
    );
  }
}
