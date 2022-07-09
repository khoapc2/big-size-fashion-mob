import 'package:shop_app/api/api_get_list_cart.dart';
import 'package:shop_app/api/api_get_orders.dart';
import 'package:shop_app/models/add_order_response_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/orders_model.dart';
import 'package:shop_app/models/payment_request_model.dart';

class OrderViewModel {
  static Future<OrdersResponse> getListOrder(int page) async {
    OrderService service = new OrderService();
    var result = await service.getListOrder(page);
    return result;
  }

  static Future<AddOrderResponse> addOrder(PaymentResquest resquest) async {
    OrderService service = new OrderService();
    AddOrderResponse result = new AddOrderResponse();
    try{
       result = await service.addOrder(resquest);
    return result;
    }catch(exception){
      print(exception);
    }
    return result;
  }
}