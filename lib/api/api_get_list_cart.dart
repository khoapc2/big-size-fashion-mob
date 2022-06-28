
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';

import 'package:http/http.dart' as http;
import '../locator.dart';
import '../twilio_verify.dart';

class CartService {
   final storage = const FlutterSecureStorage();
   
  Future<ListCartResponse> getListCart() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/carts/get-list-cart";

     ListCartResponse listCartResponse = new ListCartResponse();  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ (await storage.read(key: "token"))!
        });

    if(response.statusCode == 200){
      try{
          listCartResponse = ListCartResponse.fromJson(json.decode(response.body));
      }catch(e){
          print(e.toString());
      }
      
    } else {
      throw Exception(Exception);
    }
    //print("listCartResponse: "+listCartResponse.content[0].productName!);
    return listCartResponse;
  }

  Future<bool> addListCart(
      List<AddToCarRequest> addToListCartRequest) async {
    // String link = "https://104.215.186.78/";

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/carts/add-list-cart";

    print(jsonEncode(addToListCartRequest));

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ (await storage.read(key: "token"))!
      },
      body: jsonEncode(addToListCartRequest),
    );
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
  }

  Future<AddToCartResponse> addToCart(
      AddToCarRequest request) async {

    // String link = "https://104.215.186.78/";
    AddToCartResponse addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/carts/add-cart";


    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ (await storage.read(key: "token"))!
      },
      body: jsonEncode(<String, dynamic>{
        'product_detail_id' : request.productDetailId,
        'quantity': request.quantity
      },
    ));
      
    if (response.statusCode == 201 || response.statusCode == 400) {
      addToCartResponse = AddToCartResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }
}