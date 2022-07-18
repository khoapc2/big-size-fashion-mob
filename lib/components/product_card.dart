import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/get_popular_product.dart';
import 'package:shop_app/screens/detail_product/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Content product;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(product.productId!)),
                    );}, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.productId.toString(),
                    child: Image.network(product.imageUrl!),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.productName!,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
                  Text(
                    product.promotionPrice != null?
                    "${product.promotionPrice} VNĐ" :
                    "${product.price} VNĐ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  product.promotionValue != null?
            Container(
              child:
              Row(
                children: [
                  Text("${formatter.format(product.price!)} VNĐ", style: TextStyle(decoration: TextDecoration.lineThrough),),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    color: kPrimaryColor,
                    child: Text("-${product.promotionValue}", style: TextStyle(color: Colors.white),),)
                ],
              )
            )
            :Container()
            ],
          ),
        ),
      ),
    );
  }
}
