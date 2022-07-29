import 'package:flutter/material.dart';
import 'package:shop_app/blocs/cart_bloc.dart';
import 'package:shop_app/list_cart.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/service/storage_service.dart';

import '../../locator.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
 static String routeName = "/cart";
 double total = 0;
 int quantity = 0;
 
 bool initState = true;
 
  var currentListCart = locator.get<ListCart>();
 @override
  State<StatefulWidget> createState() => CartScreenState();

  
}



class CartScreenState extends State<CartScreen>{
  final StorageService _storageService = StorageService();
  CartBloc _cartBloc = new CartBloc();
  
  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  static Future<ListCartResponse> getListCart(String token) async {
    CartBloc service = new CartBloc();
    var result = await service.getListCart(token);
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if(token.hasData){
            return FutureBuilder(
      future: getListCart(token.data!),
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
      appBar: buildAppBar(context, token.data!),
      body:  Body(updateTotal),
      bottomNavigationBar: CheckoutCard(total: widget.total,updateCart: updateCart,token: token.data!),                                                                                                                                                                                                                                                    
    );}
    else{
      print("đen là do thằng này nè");
      return Scaffold(
      appBar: buildAppBar(context, token.data!),
      body:  Container(
        child: _buildProgressIndicator(),
      ));
    }
    });
        }else{
          return _buildProgressIndicator();
        }
    });
    
  }

  AppBar buildAppBar(BuildContext context, String token) {
    print("Xem nó chạy mấy lần");
    return AppBar(
      leading: 
      IconButton(icon: Icon(Icons.arrow_back),
      onPressed: (){
        updateCart(token);
        widget.currentListCart.setListCart(null);
        widget.currentListCart.total = 0;
        Navigator.pop(context);
      }),
      title: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Column(
        children: [
    
          Text(
            "Giỏ hàng",
            style: TextStyle(color: Colors.black),
          ),
          // Text(
          //   "${widget.quantity} sản phẩm",
          //   style: Theme.of(context).textTheme.caption,
          // ),
          
        ],
      ),
      GestureDetector(
          onTap: (){
            updateCart(token);
            widget.currentListCart.setListCart(null);
            widget.currentListCart.total = 0;
            Navigator.pop(context);
          },
          child: Text(
            "Mua thêm",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        ],
      )
      
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

    void updateCart(String token){
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
        addListCart(listCart, token);
    }

     Future<bool?> addListCart(List<AddToCarRequest> listCartRequest, String token)
  async {
    
    try {
      return await _cartBloc.addListCart(listCartRequest, token);
    } catch (Exception) {
      
      print("lỗi nè:"+Exception.toString());
    }
    return false;
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
        widget.quantity = widget.currentListCart.getListCart()!.length;
      print("Total đã đc cập nhật");
    });
  }
}
