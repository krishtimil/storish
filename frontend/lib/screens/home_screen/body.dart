import 'package:flutter/material.dart';
import 'package:storish/utils/constant.dart';
import 'package:storish/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: SizeConfig.screenWidth*0.6,
                    height:50,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'search product',
                      ),
                    ),
            
                  )
                ],
              ),
            )
          ],
        )),
    );
  }
}