import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';

import 'cart_controller.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
 static String routeName = "/cart";
 final CartController _controller = Get.put(CartController());
 double total = 0;
 @override
  State<StatefulWidget> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen>{
  @override
  void initState() {
    // TODO: implement initState
    updateTotal();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:  Body(updateTotal),
      bottomNavigationBar: CheckoutCard(total: widget.total),                                                                                                                                                                                                                                                    
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Giỏ hàng",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} sản phẩm",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
    }

   void updateTotal(){
    setState(() {
      widget.total = 0;
      demoCarts.forEach((cart) { widget.total += (cart.numOfItem*cart.product.price);});
      print("Total đã đc cập nhật");
    });
  }

}
