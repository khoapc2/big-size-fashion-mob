import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/blocs/notification_bloc.dart';
import 'package:shop_app/blocs/product_bloc.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/notification_response_model.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  Body({required this.contents});
  final String contents;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  ProductBloc _productBloc = new ProductBloc();
  NotificationBloc _notiBloc = new NotificationBloc();
  List products = <Content>[];
  int testValue = 1;
  final StorageService _storageService = StorageService();
  bool isFirstRun = true;


  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
     //call api
     var token = await getUserToken();
      var response = await getNotiication(token!, page);
      setState(() {
        isLoading = false;
        products.addAll(response.content!.toList());
        page++;
      });
    }
  }

     Future<NotificationResponse> getNotiication(String token, int page) async {
    
    var result = await _notiBloc.getNotification(token, page);
    return result;
  }

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

   void dispose() {
    _sc.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
if(isFirstRun){
      isFirstRun = false;
      return _buildProgressIndicator();
    }
  if(isFirstRun != true && products.length != 0){
      

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        controller: _sc,
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == products.length) {
          return _buildProgressIndicator();
        } else {
           return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:

          Column(children: [
              CartCard(content: products[index]),
                Divider(thickness: 2.0,
            color: Colors.grey[100],)
            ]
        ));}
        } 
      ),
    );}
    return Center(child: Text("Không có thông báo"),);
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
