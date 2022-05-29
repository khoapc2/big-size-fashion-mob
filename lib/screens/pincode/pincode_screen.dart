import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import 'components/body.dart';

class PincodeScreen extends StatelessWidget {
  static String routeName = "/pincode";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("PIN CODE"),
      ),
      body: Body(),
    );
  }
}
