import 'package:flutter/material.dart';
//import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/locator.dart';
import 'package:shop_app/screens/signup_userprofile/components/profileedit_form.dart';
import 'package:shop_app/screens/signup_userprofile/components/profileedit_header.dart';

import '../../../twilio_verify.dart';

class Body extends StatelessWidget {
  
  var _twilio = locator.get<TwilioVerify>();
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
              phone: _twilio.getPhone()!,
              email: ""),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
