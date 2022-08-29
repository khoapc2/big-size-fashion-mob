import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_status/components/order_detail.dart';
import 'components/body.dart';
import 'components/send_button.dart';

class RatingScreen extends StatelessWidget{
  static const String routeName = '/feedback';
  RatingScreen(this.para);
  var createFeedBack = new CreateFeedback();
  final FeedBackPara para;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
            Row(children: [
              Text('Nhận xét sản phẩm',style: TextStyle(color: Colors.black.withOpacity(1)))],
            ),
      ),
      body: Body(para,createFeedBack),
        bottomNavigationBar:
        SendButton(createFeedBack)
    );
    }
  }

  