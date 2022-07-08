import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_model.dart';

import 'components/body.dart';

class SearchProductScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  SearchProductScreen({required this.searchValue});
  final String searchValue;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(searchValue: searchValue),
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
