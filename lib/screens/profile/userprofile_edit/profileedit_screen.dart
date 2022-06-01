import 'package:flutter/material.dart';

import 'components/body.dart';

class UserProfileEditScreen extends StatelessWidget {
  static String routeName = "/userprofileedit";
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
