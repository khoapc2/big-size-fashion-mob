import 'package:flutter/material.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
<<<<<<< HEAD
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
=======
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(38),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /*
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
<<<<<<< HEAD
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
=======
                */
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                /*
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
<<<<<<< HEAD
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
=======
                */
                //SizedBox(height: getProportionateScreenHeight(20)),
                //NoAccountText(),
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
              ],
            ),
          ),
        ),
      ),
    );
  }
}
