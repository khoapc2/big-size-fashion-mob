import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/profile/userprofile/components/userprofile_header.dart';
import 'package:shop_app/screens/profile/userprofile/components/userprofile_info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          UserProfileHeader(),
          SizedBox(
            height: 10,
          ),
          UserProfileInfo(),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        side: BorderSide(color: kPrimaryColor)))),
            child: Container(
              width: 250,
              height: 60,
              alignment: Alignment.center,
              //color: kPrimaryColor,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.00),
                ),
                color: kPrimaryColor,
              ),
              child: Text(
                "Sua thong tin",
                style: TextStyle(
                  fontFamily: "QuickSandMedium",
                  fontSize: 30,
                ),
              ),
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
