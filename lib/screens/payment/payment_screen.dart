import 'package:flutter/material.dart';
import 'package:shop_app/screens/payment/components/body.dart';
import 'package:shop_app/screens/payment/payment_button.dart';

class PaymentScreen extends StatelessWidget{
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: PaymentButton()
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Thanh toán', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}