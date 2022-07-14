import 'package:shop_app/api/api_login_service.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';

class LoginViewModel {
  Future<LoginResponseModel?> getLoginResponse(String phoneNumber)
  async {
    
      print("getLoginResponse is running");
    LoginResponseModel? response;
    LoginService services = new LoginService();
    try {
      response = await services.login(phoneNumber);
    } catch (Exception) {
      
      print("lỗi nè:"+Exception.toString());
      response = null;
    }
    return response;
  }

  // static Future<String> getRole() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String role = prefs.getString('role');   
  //   return role;
  // }
}