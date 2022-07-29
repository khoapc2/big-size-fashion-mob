import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/locator.dart';
import 'package:shop_app/screens/cart/cart_controller.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';


import '../../../constants.dart';
import '../../../list_cart.dart';
import '../../../size_config.dart';
class CheckoutCard extends StatelessWidget {
   double? total = 0;
   final updateCart;
   final token;
   var currentListCart = locator.get<ListCart>();
   CheckoutCard({
    Key? key,this.total, this.updateCart, this.token
    
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
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
                        text: total == 0.0?"0 VNĐ":formatter.format(total)+" VNĐ",
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
                      updateCart(token);
                      if(currentListCart.listCart!.length == 0){
                         showAlertDialog(context, "Thêm sản phẩm vào giỏ hàng để thanh toán");

                      }
                      else{
                          Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                      }
                     // Navigator.pushNamed(context, PaymentScreen.routeName);
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

  void _showToast(BuildContext context, String content) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

 
}
 showAlertDialog(context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Thông báo"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

