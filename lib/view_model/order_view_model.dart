import 'package:shop_app/api/api_get_list_cart.dart';
import 'package:shop_app/api/api_get_orders.dart';
import 'package:shop_app/models/add_order_response_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/models/payment_request_model.dart';

class OrderViewModel {
  static Future<OrdersResponse> getListOrder(int page, String token) async {
    OrderService service = new OrderService();
    var result = await service.getListOrder(page, token);
    return result;
  }

  static Future<AddOrderResponse> addOrder(PaymentResquest resquest, String token) async {
    OrderService service = new OrderService();
    AddOrderResponse result = new AddOrderResponse();
    try{
       result = await service.addOrder(resquest, token);
    return result;
    }catch(exception){
      print(exception);
    }
    return result;
  }
}