

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import 'components/body.dart';


class AddressScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Địa chỉ",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            right: 20.0
          ),
          child: IconButton(onPressed: () => null, icon: Icon(Icons.add, color: kPrimaryColor)),
        )
        
      ],
    );
  }
}
