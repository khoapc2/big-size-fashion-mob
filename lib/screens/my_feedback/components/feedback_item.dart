import 'package:flutter/material.dart';

import 'get_star.dart';

class FeedbackItem extends StatelessWidget {
  var name, rating, date, content;
  FeedbackItem(this.name, this.rating, this.date, this.content, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: 370,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 7),
            Row(
              children: [
                Row(
                    children: getAllStars(rating)),
                SizedBox(width: 10),
                Text(date)
              ],
            ),
            SizedBox(height: 7),
            Text(content, maxLines: 6)
          ],
        ));
  }
}

