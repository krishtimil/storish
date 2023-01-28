import 'package:flutter/material.dart';
import 'package:storish/utils/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.amber,
                )
              ],
            ),
          )
        ],
      ),
      ),
    );
  }
}
