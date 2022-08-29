import 'package:flutter/material.dart';

import 'components/body.dart';

class SearchFitProductsByCategoryScreen extends StatelessWidget {
  static String routeName = "/cart";
  String? name;
  @override
  SearchFitProductsByCategoryScreen({required this.category, required this.name});
  final String category;
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
        title: Text(name!, style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      );
}
}
