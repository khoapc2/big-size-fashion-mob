import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/screens/address_copy/address_copy_screen.dart';
import 'package:shop_app/screens/payment/payment_screen.dart';
import 'package:shop_app/screens/pick_voucher/pick_voucher_screen.dart';

import '../../../constants.dart';
import '../../../list_cart.dart';
import '../../../location.dart';
import '../../../locator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int activeCard = 0;
  bool _isLoading = false;
  late Timer _timer;
  var locationSelected = locator.get<Location>();
  var currentListCart = locator.get<ListCart>();
 pay() {
   setState(() {
      _isLoading = true;
    });

    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          timer.cancel();
        });
      },
    );
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activeCard == 0?
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: activeCard == 0 ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.wallet_giftcard_rounded, size: 70.0, color: Colors.black)
                          ,
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Trả sau", style: TextStyle(color: Colors.black, fontSize: 18),)
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                ),
              ):
               activeCard == 1?
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: activeCard == 1 ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.grey.shade200
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network('https://img.icons8.com/ios/2x/mac-os.png', height: 50),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("The Flutter Lover", style: TextStyle(color: Colors.black, fontSize: 18),),
                              Image.network('https://img.icons8.com/ios/2x/sim-card-chip.png', height: 35,),
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                ),
              ):
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: activeCard == 2 ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.yellow.shade800,
                        Colors.yellow.shade900,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Credit Card", style: TextStyle(color: Colors.white),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("**** **** **** 7890", style: TextStyle(color: Colors.white, fontSize: 30),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("theflutterlover", style: TextStyle(color: Colors.white),),
                              Image.network('https://img.icons8.com/color/2x/mastercard-logo.png', height: 50),
                            ],
                          )
                        ],
                      )
                    ]
                  ),
                ),
              )
              ,
              SizedBox(height: 50,),
              Text("Phương thức thanh toán", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              
                SizedBox(height: 20,),
                 Row(
                  children: [
                    GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCard = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: activeCard == 0 ? Border.all(color: Colors.grey.shade300, width: 1) 
                          : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                      ),
                      child: Icon(Icons.wallet_giftcard_rounded, size: 50.0, color: Colors.black)
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCard = 1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: activeCard == 1 ? Border.all(color: Colors.grey.shade300, width: 1) 
                          : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                      ),
                      child: Image.network('https://img.icons8.com/ios-filled/2x/apple-pay.png', height: 50,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCard = 2;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: activeCard == 2 ? Border.all(color: Colors.grey.shade300, width: 1) 
                          : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
                      ),
                      child: Image.network('https://img.icons8.com/color/2x/mastercard-logo.png', height: 50,),
                    ),
                  ),
                ]
              ),
              SizedBox(height: 20,),
               Container(
                height: 50,
                padding: EdgeInsets.only(left: 5.0,),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        Icon(Icons.location_on, color: kPrimaryColor),
                    Text("Địa chỉ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                      ],),
                    ),
                    TextButton(
                      onPressed: () {
                Navigator.push(
                        context,
                     MaterialPageRoute(builder: (context) => AddressScreen()),
                    );
                      }, 
                      child: Row(
                        children: [
                          Text(locationSelected.locationId ==null ? "Chọn địa chỉ" :locationSelected.location!.substring(0,15)+"..."),
                          Icon(Icons.keyboard_arrow_right, size: 20,)
                        ],
                      )
                    )
                  ],
                ),
              ),
               Container(
                height: 50,
                padding: EdgeInsets.only(left: 5.0,),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(children: [
                        Icon(Icons.fact_check_rounded, color: kPrimaryColor),
                    Text("Chi tiết thanh toán", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                      ],),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tổng tiền hàng ${currentListCart.total}"),
                    Text("Tổng tiền vận chuyển: ${currentListCart.shippingFee}"),
                    Text("Tổng thanh toán: ${currentListCart.total + currentListCart.shippingFee}")
                  ],
                ),
              )
              
            ],
          ),
        ),
      );
  }
}