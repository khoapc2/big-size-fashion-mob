import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';

class AddToCartService {
  HttpClient client = HttpClient();
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
      },
      body: jsonEncode(<String, dynamic>{
        'product_detail_id' : request.productDetailId,
        'quantity': request.quantity
      },
    ));
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      addToCartResponse = AddToCartResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }
}