import 'package:shop_app/api/api_get_all_store_service.dart';
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/Store_model.dart';

class StoreViewModel {
  static Future<StoreResponseModel> getAllStores() async {
    StoreService service = new StoreService();
    var result = await service.getAllStore();
    return result;
  }
}