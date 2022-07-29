import 'package:flutter/material.dart';
import 'package:shop_app/models/profile_response_model.dart';

import 'components/body.dart';

class UserProfileEditScreen extends StatelessWidget {
  final String userToken;
  final ProfileResponse? staffProfile;
  const UserProfileEditScreen(
      {Key? key, required this.staffProfile, required this.userToken})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cập nhật thông tin cá nhân", style: TextStyle(color: Colors.black),),
      ),
      body: Body(
        userToken: userToken,
        staffProfile: staffProfile,
      ),
    );
  }
}
