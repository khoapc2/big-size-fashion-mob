
import 'dart:convert';

import 'package:shop_app/models/zalo_response_model.dart';
import 'package:http/http.dart' as http;

class ZaloPayBloc {
  Future<ZaloResponse> createOrder(
      double totalPrice, String token) async {
        int totalPriceInt = totalPrice.round();
        String totalPriceString = totalPriceInt.toString();

    // String link = "https://104.215.186.78/";
    ZaloResponse addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/zalo-pay/money";
  

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ token
      },
      body: jsonEncode(<String, dynamic>{
        'total_price' : totalPriceString,
      },
    ));
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      addToCartResponse = ZaloResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }
}

