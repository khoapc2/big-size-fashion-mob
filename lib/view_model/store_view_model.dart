import 'package:shop_app/api/api_get_all_store_service.dart';
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/Store_model.dart';
import 'package:shop_app/models/ge_nearest_store_model.dart';
import 'package:shop_app/models/get_address_model.dart';

import '../list_cart.dart';
import '../locator.dart';

class StoreViewModel {

  static Future<StoreResponseModel> getAllStores() async {
    StoreService service = new StoreService();
    var result = await service.getAllStore();
    return result;
  }

   Future<GetNearestStoreModel> getNearestStores(String address) async {
    StoreService service = new StoreService();
    var result = await service.getNearestStore(address);
    return result;
  }
}