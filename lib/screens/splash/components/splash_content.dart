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
<<<<<<< HEAD
          "TOKOTO",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
=======
          "BIG SIZE",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(50),
            //fontFamily: "QuickSandBold",
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
<<<<<<< HEAD
        Text(
          text!,
=======
        SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20,
          ),
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
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
