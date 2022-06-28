import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/order_detail_model.dart';

import '../../../list_cart.dart';
import '../../../locator.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class OrderDetail extends StatefulWidget {
  
  OrderDetailResponse _orderDetailResponse;
  OrderDetail(this._orderDetailResponse);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    //       return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //     itemCount: widget.currentListCart.getListCart()!.length,
    //     itemBuilder: (context, index) => Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Dismissible(
    //         key: Key(widget.currentListCart.getListCart()![index].productDetailId.toString()),
    //         direction: DismissDirection.endToStart,
    //         onDismissed: (direction) {
    //           setState(() {
    //             widget.currentListCart.getListCart()!.removeAt(index);
    //           });
    //         },
    //         background: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20),
    //           decoration: BoxDecoration(
    //             color: Color(0xFFFFE6E6),
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           child: Row(
    //             children: [
    //               Spacer(),
    //               SvgPicture.asset("assets/icons/Trash.svg"),
    //             ],
    //           ),
    //         ),
    //         child: 
    //         CartCard(cart: widget.currentListCart.getListCart()![index]),
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      child: Column(children: getListCart()),
    );
  }
  List<Widget> getListCart(){
    return List.generate(widget._orderDetailResponse.content!.productList!.length, 
    (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget._orderDetailResponse.content!.productList![index].productDetailId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget._orderDetailResponse.content!.productList!.removeAt(index);
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
            CartCard(cart: widget._orderDetailResponse.content!.productList![index]),
          ),
        ),);
  }
  }
