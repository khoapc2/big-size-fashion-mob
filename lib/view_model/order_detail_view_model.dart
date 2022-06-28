import 'package:shop_app/api/api_get_orders.dart';
import 'package:shop_app/api/api_order_detail.dart';
import 'package:shop_app/models/order_detail_model.dart';
import 'package:shop_app/models/orders_model.dart';

class OrderDetailViewModel {
  static Future<OrderDetailResponse> getOrderDetail(int orderId) async {
    OrderDetailService service = new OrderDetailService();
    var result = await service.getOrderDetail(orderId);
    return result;
  }
}