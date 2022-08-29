import 'package:flutter/material.dart';

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
        title: Text(category, style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}
