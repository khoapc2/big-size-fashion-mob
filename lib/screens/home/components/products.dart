import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/product_model.dart' as product;
import 'package:shop_app/screens/cart/components/cart_card.dart';
import 'package:shop_app/screens/details%20copy/details_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/view_model/product_view_model.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Products extends StatelessWidget{
  Products(this.listProducts);
  final List<product.Content?> listProducts;
  @override
  Widget build(BuildContext context) {
    return 
           Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Sản phẩm", press: () {}),
        ),
      Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: 
      Column(
        children: List.generate(listProducts.length + 1 , (index) {
             if (index == listProducts.length){
            return _buildProgressIndicator();
        }else{
           return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(listProducts[index]!.productId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // setState(() {
              //   demoCarts.removeAt(index);
              // });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: 
            Column(children: [
                
            CartCard(content: listProducts[index]),
            Divider(thickness: 2.0,
            color: Colors.grey[100],)
            ],)

          ),
        );
        }
        } 
       
        
        ),)
      ,
      )],
    );
          }

          Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child:  CircularProgressIndicator(),
        ),
    );
  }
         
    } 

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.content, 
  }) : super(key: key);

  final product.Content? content;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    return 
    GestureDetector(
      onTap: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(content!.productId!)),
                    );
                    //print(_controller.total.value.toString());
                      // print(total);
                    
      },
      child: Row(
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
                text: content!.promotionPrice == null?"${formatter.format(content!.price!)} VNĐ":"\đ${formatter.format(content!.promotionPrice)} VNĐ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor)
              ),
            ),
            SizedBox(height: 5),
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
            :Container()
          ],
        ),
        ),
            ]
          ),
        ),
        ]
      ,
    )
    );
    
  }

  void _onSearchButtonPressed() {
    print("icon clicked");
  }

}


