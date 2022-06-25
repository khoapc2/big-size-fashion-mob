import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/detail_product_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/view_model/detail_product_view_model.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'stores.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final int productId;
  

  Body({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var detailResponse = DetailProductViewModel.getListProductById(productId);

    return FutureBuilder(
      future: detailResponse,
      builder: (BuildContext context, AsyncSnapshot<DetailProductResponse> snapshot){
      if(snapshot.hasData){
             return 
    ListView(
      children: [
        ProductImages(product: snapshot.data!.content),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: snapshot.data!.content,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(),
                    Stores(),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
      }else{
        return Container();
      }
    });
   
  }
}
