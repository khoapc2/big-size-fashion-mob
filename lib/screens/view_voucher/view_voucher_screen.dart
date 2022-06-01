import 'package:flutter/material.dart';

import 'components/body.dart';

class ViewVoucherScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
            title: Text('Mã giảm giá', style: TextStyle(color: Colors.black),),
      
          ),
          body: Body()
    );
  }
}