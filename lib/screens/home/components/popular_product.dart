import 'package:flutter/material.dart';
import 'package:shop_app/blocs/product_bloc.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/get_popular_product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
   PopularProducts({
    Key? key,
  }) : super(key: key);

   ProductBloc _productBloc = new ProductBloc();
     Future<GetListPopularProductResponse> getPopularProducts() async {
   
    var result = await _productBloc.getPoularProducts();
    return result;
  }
  @override
  Widget build(BuildContext context) {
    var popularProductsResponse = getPopularProducts();
    return 
    FutureBuilder(
      future:  popularProductsResponse,
      builder: (BuildContext context, AsyncSnapshot<GetListPopularProductResponse> snapshot)
    {
        if(snapshot.hasData){
            return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Sản phẩm bán chạy", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                snapshot.data!.content!.length,
                (index) {
                    return ProductCard(product: snapshot.data!.content![index]);// here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
        }else{
          return Container();
        }
    });
    
  }
}
