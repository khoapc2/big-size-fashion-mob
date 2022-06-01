import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: getProportionateScreenWidth(50),
        ),
        Container(
          alignment: Alignment.center,
          //color: Colors.blue,
          width: 300,
          height: 50,
          child: Text(
            "CAI DAT",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "QuickSandBold",
              fontSize: 30,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
