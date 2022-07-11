import 'package:flutter/material.dart';

import 'feedback_item.dart';
import 'image_banner.dart';
import 'rating_feedback.dart';

class Body extends StatelessWidget{

  Body({required this.urlImage, this.productId});
  final String? urlImage;
  final int? productId;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: [
        Image.network(urlImage!, color: Colors.grey[100],),
        ListFeedBack()
      ]
    );
  }
}

class ListFeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        RatingAndFeedback(),
        FeedbackItem("Khoa Wjpu", 5, "13:00 19/10/2021", "kimochiiii"),
        FeedbackItem("An", 5, "7:00 18/10/2021", "Dừng lại đi"),
        FeedbackItem("Long", 5, "16:00 17/10/2021", "ahihi"),
        FeedbackItem("KhoaPC", 5, "18:00 16/10/2021",
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
      ],
    ));
  }
}