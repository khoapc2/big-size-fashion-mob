import 'package:flutter/material.dart';
import 'package:shop_app/screens/pincode/pincode_screen.dart';
import 'package:shop_app/screens/setting/components/setting_header.dart';

import 'setting_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          SettingHeader(),
          SizedBox(height: 20),
          SettingMenu(
            text: "PIN CODE",
            icon: "assets/icons/Lock.svg",
            press: () =>
                {Navigator.pushNamed(context, PincodeScreen.routeName)},
          ),
        ],
      ),
    );
  }
}
