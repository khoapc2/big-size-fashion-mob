import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/payment_request_model.dart';
import 'package:shop_app/screens/details%20copy/components/top_rounded_container.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/view_model/order_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../list_cart.dart';
import '../../location.dart';
import '../../locator.dart';
import '../../size_config.dart';

class PaymentButton extends StatelessWidget{
  var currentListCart = locator.get<ListCart>();
   var locationSelected = locator.get<Location>();
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    // TODO: implement build
    return Container(
      
                      height:137.0,
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
                  Text("Tổng tiền", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text("${formatter.format(currentListCart.total + currentListCart.shippingFee)} VNĐ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 10),
                         DefaultButton(
                          text: "Thanh toán",
                          press: () async {
                              var paymentMethod = currentListCart.paymentMethod;
                              var request = new PaymentResquest(
                                deliveryAddress: locationSelected.locationId,
                                orderType: true,
                                paymentMethod: paymentMethod == 0 ? "Trả sau" : "Zalopay",
                                promotionPrice: 0,
                                totalPrice: currentListCart.total,
                                shippingFee: currentListCart.shippingFee,
                                storeId: currentListCart.storeId
                                );
                                OrderViewModel.addOrder(request);
                                currentListCart.setListCart(null);
                                currentListCart.total = 0;
                                locationSelected.setLocationId(null);
                                Navigator.pushNamed(context, HomeScreen.routeName);
                            paymentMethod == 0 ? launch('https://sbgateway.zalopay.vn/openinapp?order=eyJ6cHRyYW5zdG9rZW4iOiIyMjA3MDcwMDAwMDU1Nzl1OHp5M084IiwiYXBwaWQiOjI1NTR9') : print("Trả sau");
                          _showToast(context);
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