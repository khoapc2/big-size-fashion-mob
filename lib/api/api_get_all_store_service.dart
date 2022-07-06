import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/Store_model.dart';


import 'package:http/http.dart' as http;
import 'package:shop_app/models/ge_nearest_store_model.dart';

class StoreService{
  final storage = const FlutterSecureStorage();
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

  Future<GetNearestStoreModel> getNearestStore(String address) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/stores/nearest/"+address;

   GetNearestStoreModel storeResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ (await storage.read(key: "token"))!
        });

    if(response.statusCode == 200){
      storeResponseModel = GetNearestStoreModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return storeResponseModel;

  }
}