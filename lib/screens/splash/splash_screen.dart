import 'package:flutter/material.dart';
import 'package:storish/screens/splash/components/body.dart';
import 'package:storish/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
