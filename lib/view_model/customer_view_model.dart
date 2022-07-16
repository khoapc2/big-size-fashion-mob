import 'package:shop_app/api/api_customer.dart';
import 'package:shop_app/models/update_profile_request_model.dart';
import 'package:shop_app/models/update_profile_response_model.dart';

class CustomerViewModel {
  Future<UpdateProfileResponseModel?> updateProfile(UpdateProfileRequestModel request, String token)
  async {
    CustomerService services = new CustomerService();
    try {
      return await services.updateProfile(request, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }
}