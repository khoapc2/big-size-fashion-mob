import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/models/create_feedback_response_model.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';

class FeedbackService {
  final storage = const FlutterSecureStorage();
  HttpClient client = HttpClient();
  Future<CreateFeedbackResponse> createFeedback(
      CreateFeedbackRequest request) async {

    // String link = "https://104.215.186.78/";
    CreateFeedbackResponse addToCartResponse;

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/feedbacks";


    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer "+ (await storage.read(key: "token"))!

      },
      body: jsonEncode(<String, dynamic>{
        'product_id' : request.productId,
        'content': request.content,
        'rate' : request.rate
      },
    ));
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      addToCartResponse = CreateFeedbackResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }
}