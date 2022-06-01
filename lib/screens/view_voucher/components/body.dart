import 'package:flutter/material.dart';
import 'package:shop_app/screens/view_voucher/components/voucher_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
                scrollDirection: Axis.vertical,
                children:[
                  MyVoucher(10.0, 20.0),
                  MyVoucher(10.0, 20.0),
                  MyVoucher(10.0, 20.0)
                ],
              );
  }
}