import 'dart:convert';

import 'package:shop_app/models/add_address_request_model.dart';
import 'package:shop_app/models/add_address_response_model.dart';
import 'package:shop_app/models/get_address_model.dart';

import 'package:http/http.dart' as http;

class AddressBloc {
  Future<GetAddressesResponse> getAddress(String token) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/addresses";

    GetAddressesResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ token
        });

    if(response.statusCode == 200){
      productResponseModel = GetAddressesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<AddAddressResponse> addToAddress(
      AddAddressRequest request, String token) async {

    // String link = "https://104.215.186.78/";
    AddAddressResponse addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/addresses";


    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ token

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