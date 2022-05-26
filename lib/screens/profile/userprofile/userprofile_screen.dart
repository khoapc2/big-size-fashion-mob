import 'package:flutter/material.dart';

import 'components/body.dart';

class UserProfileScreen extends StatelessWidget {
  static String routeName = "/userprofile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserProfile"),
      ),
      body: Body(),
    );
  }
}
