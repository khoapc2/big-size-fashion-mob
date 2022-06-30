import 'package:shop_app/api/api_get_list_cart.dart';
import 'package:shop_app/api/api_get_orders.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/models/payment_request_model.dart';

class OrderViewModel {
  static Future<OrdersResponse> getListOrder() async {
    OrderService service = new OrderService();
    var result = await service.getListOrder();
    return result;
  }

  static Future<bool> addOrder(PaymentResquest resquest) async {
    OrderService service = new OrderService();
    bool result = false;
    try{
       result = await service.addOrder(resquest);
    return result;
    }catch(exception){
      print(exception);
    }
    return result;
  }
}