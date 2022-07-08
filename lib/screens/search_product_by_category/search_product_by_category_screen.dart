import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/get_list_product_by_category_model.dart';

import 'components/body.dart';

class SearchProductsByCategoryScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  SearchProductsByCategoryScreen({required this.category});
  String category;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(contents: category),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tìm sản phẩm', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}
