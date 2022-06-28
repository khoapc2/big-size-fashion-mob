import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:http/http.dart' as http;

class OrderService {
   final storage = const FlutterSecureStorage();
   
  Future<OrdersResponse> getListOrder() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/orders-s/customer";

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
}
