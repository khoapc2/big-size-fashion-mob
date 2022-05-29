import 'package:flutter/material.dart';

import '../../app_properties.dart';
import 'components/body.dart';

class AddddressScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(context),
      body: Body()
    );
  }

  AppBar buildAppBar(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        title: Text(
          'Thêm địa chỉ mới',
          style: const TextStyle(
              color: darkGrey,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
              fontSize: 18.0),
        ),
      );
  }
}