import 'package:flutter/material.dart';

import 'feedback_item.dart';
import 'image_banner.dart';
import 'rating_feedback.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: [
        ImageBanner("assets/images/Image Popular Product 1.png", Colors.grey),
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
        FeedbackItem("KhoaPC", 5, "18:00 16/10/2021",
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
      ],
    ));
  }
}