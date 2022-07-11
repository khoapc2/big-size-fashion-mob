import 'package:shop_app/api/api_address.dart';
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/add_address_request_model.dart';
import 'package:shop_app/models/add_address_response_model.dart';
import 'package:shop_app/models/get_address_model.dart';
import 'package:shop_app/models/get_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_popular_product.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/detail_product_id_model.dart';

class AddressViewModel {
   static Future<GetAddressesResponse> getAddress() async {
    AddressService service = new AddressService();
    var result = await service.getAddress();
    return result;
  }

  Future<AddAddressResponse?> addToAddress(AddAddressRequest cart)
  async {
    AddressService services = new AddressService();
    try {
      return await services.addToAddress(cart);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }
}