import 'package:flutter/material.dart';

import 'get_star.dart';

class RatingAndFeedback extends StatelessWidget {
  const RatingAndFeedback({Key? key, this.averageRating}) : super(key: key);
  final double? averageRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      width: 370,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(children: [
        SizedBox(
          height: 30,
          child: Text("Nhận xét và đánh giá",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Column(
          children: [
            Text(averageRating.toString(), style: TextStyle(fontSize: 50)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getAllStars(averageRating!.round())),
            //Text("có 3.999 bình luận")
          ],
        ),
      ]),
    );
  }
}