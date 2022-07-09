import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/checkout_product.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/order_detail_model.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
   CartCard({
    Key? key,
    required this.cart
  }) : super(key: key);

  final ProductList cart;
  int _quantity = 1;
  @override
  State<StatefulWidget> createState() => _CartCardState();
  }

  class _CartCardState extends State<CartCard>{
    var _productsSelected = locator.get<CheckOutProducts>();
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
     return  
      Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Image.network(widget.cart.productImageUrl!),
                  ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          width: 200.0,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cart.productName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Size "+ widget.cart.size.toString()+", màu "+widget.cart.colour.toString()),
                  ),
            Text("X"+widget.cart.quantity.toString())
                ],
              )
            ),
            Text.rich(
              TextSpan(
                text: widget.cart.discountPrice != null?"${formatter.format(widget.cart.discountPrice)} VNĐ":"${formatter.format(widget.cart.price)} VNĐ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              
              ),
            ),
          ],
        ),
        ),
            ]
          ),
        )
        ]
      ,
    ),
      );
    
    
  }

  void _onSearchButtonPressed() {
    print("icon clicked");
  }

}
