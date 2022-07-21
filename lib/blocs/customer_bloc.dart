import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';
import 'package:shop_app/models/profile_response_model.dart';
import 'package:shop_app/models/update_profile_request_model.dart';
import 'package:shop_app/models/update_profile_response_model.dart';

class CustomerBloc {
  HttpClient client = HttpClient();
  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileRequestModel request, String token) async {

    // String link = "https://104.215.186.78/";
    UpdateProfileResponseModel addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/customers/update-profile";

    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ token
      },
      body: jsonEncode(<String, dynamic>{
        'fullname' : request.fullname,
        'email': request.email,
        'birthday': request.birthday == "null"?null: request.birthday,
        'gender': request.gender,
        "weigth": request.weigth,
        "heigth": request.heigth
      },
    ));
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      addToCartResponse = UpdateProfileResponseModel.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }

Future<ProfileResponse> getProfile(String token) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/customers/get-own-profile";

    ProfileResponse detailProductResponseModel;  
    var test = token;
    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ token
        });

    if(response.statusCode == 200){
      detailProductResponseModel = ProfileResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return detailProductResponseModel;
  }

}