import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_model.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 88,
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
            Text.rich(
              TextSpan(
                text: "\$${content!.price!}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor)
              ),
            ),
            SizedBox(height: 10),
            content!.promotionValue != null?
            Text.rich(
              TextSpan(
                text: "-${content!.promotionValue!}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor)
              ),
            ):Container()
          ],
        ),
        ),
            ]
          ),
        ),
        ]
      ,
    );
  }

  void _onSearchButtonPressed() {
    print("icon clicked");
  }

}
