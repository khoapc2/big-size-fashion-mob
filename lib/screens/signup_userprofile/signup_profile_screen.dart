import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpUserProfileScreen extends StatelessWidget {
  static String routeName = "/signupprofile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserProfileEdit"),
      ),
      body: Body(),
    );
  }
}
