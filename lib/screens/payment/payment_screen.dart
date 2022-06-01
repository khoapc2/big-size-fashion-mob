import 'package:flutter/material.dart';
import 'package:shop_app/screens/payment/components/body.dart';

class PaymentScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Payment', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}