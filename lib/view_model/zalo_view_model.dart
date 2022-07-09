import 'package:shop_app/api/api_get_all_store_service.dart';
import 'package:shop_app/api/api_zalopay.dart';
import 'package:shop_app/models/Store_model.dart';
import 'package:shop_app/models/ge_nearest_store_model.dart';
import 'package:shop_app/models/zalo_response_model.dart';

class ZaloPayViewModel {
  static Future<ZaloResponse> createOrderFromZaloPay(double totalPrice) async {
    ZaloPayService service = new ZaloPayService();
    var result = await service.createOrder(totalPrice);
    return result;
  }

   
}