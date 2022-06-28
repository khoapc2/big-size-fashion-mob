import 'dart:convert';

import 'package:shop_app/models/Store_model.dart';


import 'package:http/http.dart' as http;

class StoreService{
  Future<StoreResponseModel> getAllStore() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/stores";

    StoreResponseModel storeResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      storeResponseModel = StoreResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return storeResponseModel;
  }
}