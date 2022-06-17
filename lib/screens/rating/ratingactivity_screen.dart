import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/body.dart';
import 'components/send_button.dart';

class RatingScreen extends StatelessWidget{
  static const String routeName = '/feedback';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
            Row(children: [
              Text('Nhận xét sản phẩm',style: TextStyle(color: Colors.black.withOpacity(1)))],
            ),
      ),
      body: Body(),
        bottomNavigationBar:
        SendButton()
    );
    }
  }

  