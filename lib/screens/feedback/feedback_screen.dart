import 'package:flutter/material.dart';

import 'components/body.dart';



class ViewFeedback extends StatelessWidget {
  const ViewFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body());
  }
}

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: Text("Nhận xét", style: TextStyle(color: Colors.black),),
      );
  }

