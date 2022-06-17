import 'package:flutter/material.dart';

import 'get_star.dart';

class RatingAndFeedback extends StatelessWidget {
  const RatingAndFeedback({Key? key}) : super(key: key);

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
            Text("5,0", style: TextStyle(fontSize: 50)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getAllStars(5)),
            Text("có 3.999 bình luận")
          ],
        ),
      ]),
    );
  }
}