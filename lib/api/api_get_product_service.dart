
import 'dart:convert';

import 'package:shop_app/models/product_model.dart';

import 'package:http/http.dart' as http;
import '../locator.dart';
import '../twilio_verify.dart';

class ProductService {
   var _twilio = locator.get<TwilioVerify>();

  Future<ProductResponseModel> getListProductByName(String? searchValue) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products"+"?ProductName="+searchValue!;

    ProductResponseModel productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<ProductResponseModel> getAllProducts() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products";

    ProductResponseModel productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }
}