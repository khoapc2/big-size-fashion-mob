import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(

          "BIG SIZE",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(50),
            //fontFamily: "QuickSandBold",
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
