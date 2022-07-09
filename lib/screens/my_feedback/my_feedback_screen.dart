import 'package:flutter/material.dart';
import 'package:shop_app/screens/my_feedback/components/update_feedback_button.dart';
import 'package:shop_app/screens/orders_status/components/order_detail.dart';

import 'components/body.dart';



class MyFeedback extends StatelessWidget {
  const MyFeedback({Key? key, this.para}) : super(key: key);
  final FeedBackPara? para;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: UpdateFeedbackButton()
      );
  }
}

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: Text("Nhận xét", style: TextStyle(color: Colors.black),),
      );
  }

