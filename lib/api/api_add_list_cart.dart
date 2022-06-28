import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';

class AddListCartService {
  HttpClient client = HttpClient();
  Future<bool> addListCart(
      List<AddToCarRequest> addToListCartRequest) async {
        bool rs;
    // String link = "https://104.215.186.78/";

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/carts/add-list-cart";

    print(jsonEncode(addToListCartRequest));

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(addToListCartRequest),
    );
      
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
  }
}