import 'dart:convert';
class LoginRequestModel {
  String phone;

  LoginRequestModel( this.phone
  );

  Map<String, dynamic> toJson() => {
      'phone_number': phone.trim(),
  };

  String loginModelToJson() => json.encode(toJson());
}

class LoginResponseModel {
   String? token;
   bool isNewCustomer;

  String? getToken(){
    return token;
  }

  bool getIsNewCustomer(){
    return isNewCustomer;
  }

  LoginResponseModel({
    required this.token,
    required this.isNewCustomer
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    var content= json["content"];
    String? token = content["token"];
    return new LoginResponseModel(
      token: content["token"],
      isNewCustomer: content["is_new_customer"],);
  }
}