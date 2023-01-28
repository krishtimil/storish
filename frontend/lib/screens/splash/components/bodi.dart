import 'package:flutter/material.dart';
import 'package:storish/utils/constant.dart';
import 'package:storish/utils/size_config.dart';

class Bodi extends StatefulWidget {
  const Bodi({super.key});

  @override
  State<Bodi> createState() => _BodiState();
}

class _BodiState extends State<Bodi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemBuilder: (context, index) => const SplashContent(
                text: "Welcome to Storish, Let's shop!",
                image: "assets/images/splash.jpg",
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "STORISH",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(36),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
