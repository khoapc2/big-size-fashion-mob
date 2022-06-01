import 'package:flutter/material.dart';
import 'package:shop_app/screens/voucher/voucher.dart';



class MyVouchers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Coupons', style: TextStyle(color: Colors.black),),
      
          ),
          body: 
              ListView(
                scrollDirection: Axis.vertical,
                children:[
                  MyVoucher(10.0, 20.0),
                  MyVoucher(10.0, 20.0),
                  MyVoucher(10.0, 20.0)
                ],
              ),
          );
  }
}
