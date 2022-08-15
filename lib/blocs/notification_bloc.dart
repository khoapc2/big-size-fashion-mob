import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shop_app/models/notification_response_model.dart';

class NotificationBloc {

  Future<NotificationResponse> getNotification(String? token, int page) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/notifications?PageNumber="+page.toString();

    NotificationResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ token!
        });

    if(response.statusCode == 200){
      productResponseModel = NotificationResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }
  }