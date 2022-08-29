import 'package:flutter/material.dart';
import '../detail_product/details_screen.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailFitProductScreen extends StatelessWidget {
  static String routeName = "/details";

  DetailFitProductScreen(this.productId){
    inputForViewFeedback.productId = productId;
  }
  final int productId;
  var inputForViewFeedback = new InputForViewingFeedback();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: 
      // PreferredSize(
      //   preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      //   child: 
      //   GestureDetector(
      //     onTap: ()=>
      //                 Navigator.push(
      //                   context,
      //                 MaterialPageRoute(builder: (context) => ViewFeedback()),
      //               )
      //               ,
      //     child: Icon(Icons.ac_unit_outlined) 
      //     //CustomAppBar(rating: agrs.product.rating),
      //   )
      // ),
      PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: 
        CustomAppBar(inputForViewingFeedback: inputForViewFeedback),
      ),
      body: Body(productId:productId, inputForViewingFeedback: inputForViewFeedback),
    );
  }
}

