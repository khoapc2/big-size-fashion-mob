import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

<<<<<<< HEAD
=======
// ignore: unused_import
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
<<<<<<< HEAD
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
=======
              fontSize: getProportionateScreenWidth(16),
              fontFamily: "QuickSandBold",
              color: Color.fromARGB(255, 0, 100, 185),
            ),
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
          ),
        ),
      ],
    );
  }
}
