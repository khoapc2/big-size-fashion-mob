import 'package:flutter/material.dart';
//import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/profile/userprofile_edit/components/profileedit_form.dart';
import 'package:shop_app/screens/profile/userprofile_edit/components/profileedit_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          UserProfileEditHeader(),
          SizedBox(
            height: 2,
          ),
          EditProfileForm(
              name: "Tran Trong Hieu",
              dob: "06/06/2000",
              phone: "0918224597",
              email: ""),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
