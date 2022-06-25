import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/feedback/feedback_screen.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  DetailsScreen(this.productId);
  final int productId;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: 
        GestureDetector(
          onTap: ()=>
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ViewFeedback()),
                    )
                    ,
          child: Icon(Icons.ac_unit_outlined) 
          //CustomAppBar(rating: agrs.product.rating),
        )
      ),
      body: Body(productId:productId),
    );
  }
}

