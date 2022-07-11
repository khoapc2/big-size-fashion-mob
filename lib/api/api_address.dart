import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/add_address_request_model.dart';
import 'package:shop_app/models/add_address_response_model.dart';
import 'package:shop_app/models/get_address_model.dart';
import 'package:shop_app/models/get_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_popular_product.dart';
import 'package:shop_app/models/product_model.dart';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/detail_product_id_model.dart';
import '../locator.dart';
import '../main.dart';
import '../twilio_verify.dart';

class AddressService {
  final storage = const FlutterSecureStorage();
  Future<GetAddressesResponse> getAddress() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/addresses";

    GetAddressesResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ (await storage.read(key: "token"))!
        });

    if(response.statusCode == 200){
      productResponseModel = GetAddressesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<AddAddressResponse> addToAddress(
      AddAddressRequest request) async {

    // String link = "https://104.215.186.78/";
    AddAddressResponse addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/addresses";


    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ (await storage.read(key: "token"))!

      },
      body: jsonEncode(<String, dynamic>{
        'receiver_name' : request.receiverName,
        'receive_address': request.receiveAddress,
        'receiver_phone': request.receiverPhone,
      },
    ));
      
    if (response.statusCode == 201 || response.statusCode == 400) {
      addToCartResponse = AddAddressResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }
}