import 'package:flutter/material.dart';

import 'components/body.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hồ sơ"),
      ),
      body: const Body(),
    );
  }
}
