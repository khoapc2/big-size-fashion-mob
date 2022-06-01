
import 'package:flutter/material.dart';

import '../../app_properties.dart';
import 'components/body.dart';

class DetailVoucherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

    AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Chi tiết mã giảm giá', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}
