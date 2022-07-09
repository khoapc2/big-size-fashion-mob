import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/checkout_product.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  final updateTotal;
   CartCard({
    Key? key,
    required this.cart,
    this.updateTotal
  }) : super(key: key);

  final Content cart;
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
                    child: Image.network(widget.cart.productImage!),
                  ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          width: 160.0,
          child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cart.productName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: widget.cart.productPromotion != null?"${formatter.format(widget.cart.productPromotion!)} VNĐ":"${formatter.format(widget.cart.productPrice)} VNĐ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              
              ),
            ),
            SizedBox(height: 5),
            widget.cart.productPromotion != null?
            Text("${formatter.format(widget.cart.productPrice)} VNĐ", style: TextStyle(decoration: TextDecoration.lineThrough),)
            :Container(),
          ],
        ),
        ),
            ]
          ),
        ),
         Column(
          children: [
            IconButton(onPressed: (){
              setState(() {
                var currentQuantity = widget.cart.quantity! + 1;
                widget.cart.setQuantity(currentQuantity);
                print("Số lượng sau khi tăng "+ currentQuantity.toString());
                widget.updateTotal();
              });
            }, icon: Icon(Icons.add_circle, size: 30,)),
            Text(widget.cart.quantity!.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            IconButton(onPressed: (){
              setState(() {
                if(widget.cart.quantity! > 1){
                  var currentQuantity = widget.cart.quantity! - 1;
                  widget.cart.setQuantity(currentQuantity);
                  widget.updateTotal();
                }
              });
            }, icon: Icon(Icons.remove_circle_outline, color: Colors.grey.shade400, size: 30,))
          ],
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
