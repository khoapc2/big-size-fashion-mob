import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';


import '../../../constants.dart';
import '../../../size_config.dart';
class CheckoutCard extends StatelessWidget {
   double? total = 0;
   CheckoutCard({
    Key? key,this.total
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng cộng:\n",
                    children: [
                      TextSpan(
                        text: total.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Thanh toán",
                    press: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                    //print(_controller.total.value.toString());
                      // print(total);
                    },

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
}
