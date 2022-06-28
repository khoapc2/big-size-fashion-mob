import 'package:shop_app/api/api_get_list_cart.dart';
import 'package:shop_app/api/api_get_orders.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/orders_model.dart';

class OrderViewModel {
  static Future<OrdersResponse> getListOrder() async {
    OrderService service = new OrderService();
    var result = await service.getListOrder();
    return result;
  }
}