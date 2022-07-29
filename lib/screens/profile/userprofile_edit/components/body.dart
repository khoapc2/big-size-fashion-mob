// ignore_for_file: no_logic_in_create_state


import 'package:flutter/material.dart';
import 'package:shop_app/models/profile_response_model.dart';
import 'package:shop_app/screens/profile/userprofile_edit/components/profileedit_form.dart';

class Body extends StatefulWidget {
  final String userToken;
  final ProfileResponse? staffProfile;
  const Body({Key? key, required this.staffProfile, required this.userToken})
      : super(key: key);

  @override
  _Body createState() => _Body(userToken, staffProfile);
}

class _Body extends State<Body> {
  final String userToken;
  final ProfileResponse? staffProfile;

  _Body(this.userToken, this.staffProfile);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 2,
          ),
          EditProfileForm(
              userToken: userToken,
              name: staffProfile!.content!.fullname.toString(),
              dob: staffProfile!.content!.birthday.toString(),
              gender: staffProfile!.content!.gender.toString(),
              height: staffProfile!.content!.heigth.toString(),
              weight: staffProfile!.content!.weigth.toString(),
              email: staffProfile!.content!.email.toString()),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
