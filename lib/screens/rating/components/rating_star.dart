import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'body.dart';


class RatingStar extends StatelessWidget {
  RatingStar(this.productName, this.createFeedback);
  final String productName;
  final CreateFeedback createFeedback;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
          children: [
            Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                createFeedback.setRating(rating);
              },)
          ],
        )
      )
      );
  }
  }