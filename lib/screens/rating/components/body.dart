

import 'package:flutter/cupertino.dart';
import 'package:shop_app/screens/rating/components/rating_star.dart';

import 'comment.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: [
          Image(
                image: AssetImage('assets/images/Image Popular Product 1.png'),
                fit:BoxFit.fill
            ),
            RatingStar(),
            Comment(),
        ],
      );
  }
}