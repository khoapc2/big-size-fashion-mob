import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/customer_account/login_response_model.dart';

class LoginService {
  HttpClient client = HttpClient();
  Future<LoginResponseModel> login(String phoneNumber) async {

    LoginResponseModel responseModel;
    // String link = "https://104.215.186.78/";

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/accounts/customer-login";

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'phone_number' : phoneNumber,
      }),
    );

    if(response.statusCode == 200 || response.statusCode == 400){
       responseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
       
    } else {
      print("Status code:"+response.statusCode.toString());
      throw Exception(Exception);
    }
    return responseModel;
  }
}