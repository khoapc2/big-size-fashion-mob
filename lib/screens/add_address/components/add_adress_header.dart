import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class AddAddressEditHeader extends StatelessWidget {
  const AddAddressEditHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: getProportionateScreenWidth(30),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(1.0)),
          //color: Colors.blue,
          width: 300,
          height: 50,
          child: Text(
            "Địa chỉ nhận hàng",
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
