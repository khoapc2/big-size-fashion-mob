import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/order_detail_model.dart';
import 'package:shop_app/screens/rating/ratingactivity_screen.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class OrderDetail extends StatefulWidget {
  
  OrderDetailResponse _orderDetailResponse;
  OrderDetail(this._orderDetailResponse);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    //       return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //     itemCount: widget.currentListCart.getListCart()!.length,
    //     itemBuilder: (context, index) => Padding(
    //       padding: EdgeInsets.symmetric(vertical: 10),
    //       child: Dismissible(
    //         key: Key(widget.currentListCart.getListCart()![index].productDetailId.toString()),
    //         direction: DismissDirection.endToStart,
    //         onDismissed: (direction) {
    //           setState(() {
    //             widget.currentListCart.getListCart()!.removeAt(index);
    //           });
    //         },
    //         background: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20),
    //           decoration: BoxDecoration(
    //             color: Color(0xFFFFE6E6),
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           child: Row(
    //             children: [
    //               Spacer(),
    //               SvgPicture.asset("assets/icons/Trash.svg"),
    //             ],
    //           ),
    //         ),
    //         child: 
    //         CartCard(cart: widget.currentListCart.getListCart()![index]),
    //       ),
    //     ),
    //   ),
    // );


    return Container(
      child: Column(children: getListCart()),
    );
  }
  List<Widget> getListCart(){
    return List.generate(widget._orderDetailResponse.content!.productList!.length, 
    (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget._orderDetailResponse.content!.productList![index].productDetailId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget._orderDetailResponse.content!.productList!.removeAt(index);
              });
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
            Column(
              children: [
                CartCard(cart: widget._orderDetailResponse.content!.productList![index]),
                Divider(thickness: 2.0,
            color: Colors.grey[100],),
                GestureDetector(onTap: (){
                 Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => RatingScreen(FeedBackPara(widget._orderDetailResponse.content!.productList![index].productId, widget._orderDetailResponse.content!.productList![index].productImageUrl,
                      widget._orderDetailResponse.content!.productList![index].productName
                      ))),
                    );
                }, 
                child: widget._orderDetailResponse.content!.status =="Đã nhận hàng"?
                    Container(
                      margin: EdgeInsets.only(left: 200),
                      
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                      ),
                      child: 
                      Center(
                        child:Text("Nhận xét",style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white)),
                        )
                    ): Container(),
                )
              ],
            ),
          ),
        ),);
  }
  }

  class FeedBackPara{
    int? productId;
    String? urlImg;
    String? productName;
    FeedBackPara(this.productId, this.urlImg, this.productName);
  }
