import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/home_screen/home_screen.dart';
import 'package:storish/utils/constant.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getData();
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
