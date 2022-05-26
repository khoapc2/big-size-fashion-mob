import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
<<<<<<< HEAD
            press: () {},
=======
            press: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => SignInScreen()),
                  (route) => false),
            },
>>>>>>> df87855c1ce34b69ff6fe93eafb52b8f4ed9010c
          ),
        ],
      ),
    );
  }
}
