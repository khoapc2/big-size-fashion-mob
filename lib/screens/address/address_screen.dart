import 'package:flutter/material.dart';
import 'package:shop_app/screens/address/components/body.dart';

class AddressScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Chọn địa chỉ nhận hàng', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
  }
}