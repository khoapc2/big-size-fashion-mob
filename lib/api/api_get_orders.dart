import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/add_order_response_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/payment_request_model.dart';

class OrderService {
   final storage = const FlutterSecureStorage();
   
  Future<OrdersResponse> getListOrder(int page) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/orders/customer"+"?PageNumber="+page.toString();

     OrdersResponse listCartResponse = new OrdersResponse();  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ (await storage.read(key: "token"))!
        });

    if(response.statusCode == 200){
      try{
          listCartResponse = OrdersResponse.fromJson(json.decode(response.body));
      }catch(e){
          print(e.toString());
      }
      
    } else {
      throw Exception(Exception);
    }
    //print("listCartResponse: "+listCartResponse.content[0].productName!);
    return listCartResponse;
  }

  Future<AddOrderResponse> addOrder(
      PaymentResquest request) async {
    // String link = "https://104.215.186.78/";

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/orders/add-order";
    AddOrderResponse addOrderResponse;

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ (await storage.read(key: "token"))!

      },
      body: jsonEncode(<String, dynamic>{
        "delivery_address": request.deliveryAddress,
        "total_price": request.totalPrice,
        "promotion_price": request.promotionPrice,
        "order_type": request.orderType,
        "payment_method": request.paymentMethod,
        "shipping_fee": request.shippingFee,
        "store_id": request.storeId
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      addOrderResponse = AddOrderResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addOrderResponse;
  }
}
