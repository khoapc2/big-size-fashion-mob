import 'package:flutter/material.dart';

import 'components/body.dart';



class ViewFeedback extends StatelessWidget {
  const ViewFeedback({Key? key, this.productId, this.urlImage, this.avarageRating}) : super(key: key);
  final String? urlImage;
  final int? productId;
  final double? avarageRating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(productId: productId,urlImage: urlImage, avarageRating: avarageRating,));
  }
}

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: Text("Nhận xét", style: TextStyle(color: Colors.black),),
      );
  }

