import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/payment_request_model.dart';
import 'package:shop_app/screens/details%20copy/components/top_rounded_container.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/view_model/order_view_model.dart';

import '../../list_cart.dart';
import '../../location.dart';
import '../../locator.dart';
import '../../size_config.dart';

class PaymentButton extends StatelessWidget{
  var currentListCart = locator.get<ListCart>();
   var locationSelected = locator.get<Location>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
                      height:136.0,
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: 
                        Column(children: [
                          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Payment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text("\$"+currentListCart.total.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10),
                         DefaultButton(
                          text: "Pay",
                          press: () async {

                              var request = new PaymentResquest(
                                deliveryAddress: 1,
                                orderType: true,
                                paymentMethod:"Trả sau",
                                promotionPrice: 0,
                                totalPrice: currentListCart.total
                                );
                                OrderViewModel.addOrder(request);
                                _showToast(context);
                                currentListCart.setListCart(null);
                                currentListCart.total = 0;
                                locationSelected.setLocationId(null);
                                Navigator.pushNamed(context, HomeScreen.routeName);
                          },
                        ),],)
                       
                      );
  }

   void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Thanh toán thành công'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}