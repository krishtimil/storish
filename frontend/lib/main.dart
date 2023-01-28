
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/home_screen/home_screen.dart';
import 'package:storish/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // home: SplashScreen(),
      home: const Home(),
    );
  }
}
