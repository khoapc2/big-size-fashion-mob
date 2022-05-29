import 'package:flutter/material.dart';

import 'components/body.dart';

class VoucherScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
            title: Text('Coupons', style: TextStyle(color: Colors.black),),
      
          ),
          body: Body()
    );
  }
}