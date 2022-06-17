import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/oder_history/components/order_card.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) {
        return Column(children: [
          OrderCard(order: demoOrders[index]),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Tổng: ${demoOrders[index].total}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              SizedBox(
                width: 17.0,
              )
            ],
          ),
          Text(
            "Chi nhánh: ${demoOrders[index].branchName}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
         Text(
            "Ngày mua: ${demoOrders[index].dateOrder}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ), 
          Container(
            height: 20.0,
            color: Colors.grey[200],
          )
        ]);
      },
    );
  }
}
