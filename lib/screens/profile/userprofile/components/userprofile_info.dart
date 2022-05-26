import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 500.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              RowUP().rowUPRow("SDT", "0918224597", 30),
              SizedBox(
                height: 10,
              ),
              RowUP().rowUPRow("Ngay sinh", "06/06/2000", 20),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RowUP extends Row {
  Row rowUPRow(String title, String content, double textSize) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          width: 180,
          margin: EdgeInsets.only(top: 20, left: 10),
          //color: Colors.blue,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 20,
              color: kSecondaryColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 180,
          margin: EdgeInsets.only(top: 20, left: 0),
          //color: Colors.red,
          child: Text(
            content,
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: textSize,
              color: kPrimaryColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
