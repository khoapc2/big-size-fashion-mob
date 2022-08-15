import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';
import 'package:shop_app/view_model/cart_view_model.dart';

import '../../../list_cart.dart';
import '../../../locator.dart';
import '../../../size_config.dart';
import '../cart_controller.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  final updateTotal;
  var currentListCart = locator.get<ListCart>();
  Body(this.updateTotal);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double? _total;
  @override
  Widget build(BuildContext context) {
          return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: widget.currentListCart.getListCart()!.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget.currentListCart.getListCart()![index].productDetailId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget.currentListCart.getListCart()!.removeAt(index);
                widget.updateTotal();
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
            child: 
            CartCard(cart: widget.currentListCart.getListCart()![index], updateTotal: widget.updateTotal)
            
          ),
        ),
      ),
    );
  }}
