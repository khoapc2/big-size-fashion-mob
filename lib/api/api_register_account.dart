import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/customer_account/login_response_model.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';

class RegisterAccountService {
  HttpClient client = HttpClient();
  Future<RegisterAccountResponse> registerAccount(
      RegisterAccountRequest registerRequestModel) async {
    RegisterAccountResponse responseModel;
    // String link = "https://104.215.186.78/";

    String link = "https://20.211.17.194/";
    String url = link + "api/v1/accounts/create-customer-account";

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "phone_number": registerRequestModel.phoneNumber,
        "fullname": registerRequestModel.fullname,
        "email": registerRequestModel.email,
        "gender": registerRequestModel.gender,
        "weigth": registerRequestModel.weigth,
        "heigth": registerRequestModel.heigth
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      responseModel = RegisterAccountResponse.fromJson(jsonDecode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return responseModel;
  }
}
