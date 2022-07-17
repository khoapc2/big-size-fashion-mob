import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';
import 'package:shop_app/screens/detail_fit_product/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content? content;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => DetailFitProductScreen(content!.productId!)),
                    );} ,
          child:  Container(
          child: Row(
            children: [
              SizedBox(
                width: 88,
                height: 150,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Image.network(content!.imageUrl!),
                  ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          width: 160.0,
          child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content!.productName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
             Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Size "+ "XL"+", màu "+"cam"),
                  ),
            Text("X"+"1")
                ],
              )
            ),
            Text.rich(
              TextSpan(
                text: content!.promotionPrice == null?"${formatter.format(content!.price!)} VNĐ":"${formatter.format(content!.promotionPrice)} VNĐ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor)
              ),
            ),
            SizedBox(height: 5.0,),
            content!.promotionValue != null?
            Container(
              child:
              Row(
                children: [
                  Text("${formatter.format(content!.price!)} VNĐ", style: TextStyle(decoration: TextDecoration.lineThrough),),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    color: kPrimaryColor,
                    child: Text("-${content!.promotionValue}"),)
                ],
              )
            )
            :Container(),
            Text("Đang giao", style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 17)),
                    Row(
                      children: [
                        Icon(Icons.alarm),  
                        Text("17/07/2022")
                      ],
                    )
                    //ListTile(leading: Icon(Icons.alarm),title: Text("17/07/2022"),)
          ],
        ),
        ),
            ]
          ),
        )
        )
       ,
        ]
      ,
    );
  }

  void _onSearchButtonPressed() {
    print("icon clicked");
  }

}
