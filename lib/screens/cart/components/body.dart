import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';

import '../../../size_config.dart';
import '../cart_controller.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  final updateTotal;
  Body(this.updateTotal);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double? _total;
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
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
            CartCard(cart: demoCarts[index], updateTotal: widget.updateTotal),
          ),
        ),
      ),
    );
    
  }

 
}
