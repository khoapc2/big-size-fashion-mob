import 'package:flutter/material.dart';
import 'package:shop_app/blocs/product_bloc.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/home/components/image_slider.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../size_config.dart';
import '../../../test_method.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'products.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
  _BodyState();
}

class _BodyState extends State<Body>{
  ScrollController _sc = new ScrollController();
  static int page = 1;
  bool isLoading = false;
  var products = <Content>[];
  ProductBloc _produtBloc = new ProductBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {

        _getMoreData(page);
      }
    });
  }

   Future<ProductResponseModel> getAllProducts(int page) async {
    
    var result = await _produtBloc.getAllProducts(page);
    return result;
  }
  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      //call ProductVm
      var listProduct = await getAllProducts(page);
      // List tList = new List();
      // for (int i = 0; i < listProduct.content!.length; i++) {
      //   tList.add(response.data['results'][i]);
      // }
 
      setState(() {
        isLoading = false;
        products.addAll(listProduct.content!.toList());
        page++;
      });
    }
  }


  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return 
    
    SafeArea(
      child: SingleChildScrollView(
        controller: _sc,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
           // const DiscountBanner(),
            const ImageForHome(),
            const Categories(),
            Divider(thickness: 6.0,
            color: Colors.grey[100]),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Divider(thickness: 6.0,
            color: Colors.grey[100]),
             PopularProducts(),
            Divider(thickness: 6.0,
            color: Colors.grey[100]),
            SizedBox(height: getProportionateScreenWidth(30)),
            Products(products),
          ],
        ),
      ),
    );
  }

}
