import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';

import 'components/body.dart';

class SearchFitProductsByCategoryScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  SearchFitProductsByCategoryScreen({required this.content});
  final List<Content>? content;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(contents: content),
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
