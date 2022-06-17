import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/checkout_product.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  final CartController _controller = Get.find();
  final updateTotal;
   CartCard({
    Key? key,
    required this.cart,
    this.updateTotal
  }) : super(key: key);

  final Cart cart;
  int _quantity = 1;
  @override
  State<StatefulWidget> createState() => _CartCardState();
  }

  class _CartCardState extends State<CartCard>{
    var _productsSelected = locator.get<CheckOutProducts>();
  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset(widget.cart.product.images[0]),
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
              widget.cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${widget.cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              
              ),
            ),
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
                widget.cart.numOfItem++;
                widget.updateTotal();
              });
            }, icon: Icon(Icons.add_circle, size: 30,)),
            Text(widget.cart.numOfItem.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            IconButton(onPressed: (){
              setState(() {
                if(widget.cart.numOfItem > 1){
                widget.cart.numOfItem--;
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
