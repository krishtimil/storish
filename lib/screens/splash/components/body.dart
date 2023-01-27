import 'package:flutter/material.dart';
import 'package:storish/utils/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                "STORISH",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(36),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
