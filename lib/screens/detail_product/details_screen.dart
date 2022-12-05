import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  DetailsScreen(this.productId){
    inputForViewFeedback.productId = productId;
  }

  final int productId;
  var inputForViewFeedback = new InputForViewingFeedback();
  

  @override
  Widget build(BuildContext context) {
    print("Đã vào được trong detail_product");
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: 
        CustomAppBar(inputForViewingFeedback: inputForViewFeedback),
      ),
      body: Body(productId:productId, inputForViewingFeedback: inputForViewFeedback),
    );
  }
}

class  InputForViewingFeedback{
  int? productId;
  String? urlImage;
  double? averageRating;
}

