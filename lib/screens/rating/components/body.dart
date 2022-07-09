

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_status/components/order_detail.dart';
import 'package:shop_app/screens/rating/components/rating_star.dart';

import 'comment.dart';


class Body extends StatelessWidget{
  final FeedBackPara para;
  var createFeedBack = new CreateFeedback();
  Body(this.para){
    createFeedBack.productId = para.productId;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: [
          Container(
                child: Image.network(para.urlImg!),
                height: 300,
                color: Colors.grey[100],
            ),
            RatingStar(para.productName!, createFeedBack),
            Comment(createFeedBack),
        ],
      );
  }
}

class CreateFeedback{
  int? productId;
  double? rating;
  String? context;
  
  void setRating(double? rating){
    this.rating = rating;
  }
  void setProductId(productId){
    this.productId = productId;
  }

  void setContext(String? context){
    this.context = context;
  }
}