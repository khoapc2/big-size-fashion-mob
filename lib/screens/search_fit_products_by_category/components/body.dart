import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  Body({required this.contents});
  final String contents;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List products = <Content>[];


  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
     //call api
      var response = await ProductViewModel.getFitProductsByCategory(widget.contents, page);
      setState(() {
        isLoading = false;
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

   void dispose() {
    _sc.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        controller: _sc,
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == products.length) {
          return _buildProgressIndicator();
        } else {
           return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(products[index].productId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(content: products[index]),
          ),
        );}
        } 
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
