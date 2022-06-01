import 'package:flutter/material.dart';

import '../../../app_properties.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/icons/gift-voucher.png'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: transparentYellow,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [            
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Mừng MU thua YB ",
                 style: TextStyle(fontSize: 20)),

                 Text("HSD: 10/12/2021 ",
                 style: TextStyle(fontSize: 13)),
               ],
             ),
          ],
        )
                ),
                ListTile(
                  subtitle: Text('Coupon giảm 65000đ cho đơn từ 150000đ(không bao gồm phí giao hàng)'),
                  leading: Icon(Icons.done_outlined),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  subtitle: Text('Coupon áp dụng cho các nhà hàng có trong chương trình'),
                  leading: Icon(Icons.done_outlined),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  subtitle: Text('Số lượng coupon có hạn nên chương trình có thể thay đổi nội dung và kết thúc sớm hơn dự kiến theo chính sách công ty'),
                  leading: Icon(Icons.done_outlined),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  subtitle: Text('Số lượng coupon có hạn nên chương trình có thể thay đổi nội dung và kết thúc sớm hơn dự kiến theo chính sách công ty'),
                  leading: Icon(Icons.done_outlined),
                  onTap: () => null,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
  }
  }