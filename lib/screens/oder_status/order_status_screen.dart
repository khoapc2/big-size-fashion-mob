import 'package:flutter/material.dart';

import '../../app_properties.dart';
import 'components/body.dart';

class OrderStatusScreen extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/visa.png'), fit: BoxFit.contain)),
      child: Container(
        color: Colors.white54,
        child: Scaffold(
            appBar: buildAppBar(context),
            body: Body()),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.grey),
              title: Text(
                'Tình trạng đơn hàng',
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: BackButton(color: Colors.black,),
            );
  }

}