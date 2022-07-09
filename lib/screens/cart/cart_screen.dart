import 'package:flutter/material.dart';
import 'package:shop_app/list_cart.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/view_model/cart_view_model.dart';

import '../../locator.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
 static String routeName = "/cart";
 double total = 0;
 int quantity = 0;
 var listCart = CartViewModel.getListCart();
 bool initState = true;
 
  var currentListCart = locator.get<ListCart>();
 @override
  State<StatefulWidget> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen>{

  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder(
      future: widget.listCart,
      builder: (BuildContext context, AsyncSnapshot<ListCartResponse> snapshot){
        if(snapshot.hasData){
          widget.quantity = snapshot.data!.content!.length;
          if(widget.currentListCart.getListCart() == null){
            widget.currentListCart.setListCart(snapshot.data!.content);
            widget.currentListCart.setTotal();
            
          }

          if(widget.initState == true){
              widget.total = widget.currentListCart.total;
              widget.initState = false;
          }
           
    return Scaffold(
      appBar: buildAppBar(context),
      body:  Body(updateTotal),
      bottomNavigationBar: CheckoutCard(total: widget.total,updateCart: updateCart,),                                                                                                                                                                                                                                                    
    );}
    else{
      print("đen là do thằng này nè");
      return Scaffold(
      appBar: buildAppBar(context),
      body:  Container(
        child: _buildProgressIndicator(),
      ));
    }
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: 
      IconButton(icon: Icon(Icons.arrow_back),
      onPressed: (){
        updateCart();
        widget.currentListCart.setListCart(null);
        widget.currentListCart.total = 0;
        Navigator.pop(context);
      }),
      title: Column(
        children: [
          Text(
            "Giỏ hàng",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${widget.quantity} sản phẩm",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
    }

    Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

    void updateCart(){
        CartViewModel response = CartViewModel();
        widget.currentListCart.total = widget.total;
        
        var currentListCart = widget.currentListCart.listCart!;

        List<AddToCarRequest> listCart = <AddToCarRequest>[];

        currentListCart.forEach
        ((element) { 
          AddToCarRequest cart = AddToCarRequest();
          cart.productDetailId = element.productDetailId;
          cart.quantity = element.quantity;
          listCart.add(cart);
        });
        response.addListCart(listCart);
    }

   void updateTotal(){
    setState(() {
      widget.total = 0;
      widget.currentListCart.getListCart()!.forEach((cart) { 
        if(cart.productPromotion == null){
            widget.total += (cart.quantity!*cart.productPrice!);
        }else{
          widget.total += (cart.quantity! * cart.productPromotion!);
        }
        });
      print("Total đã đc cập nhật");
    });
  }
}
