
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/order_detail_model.dart';

class OrderDetailService{
   Future<OrderDetailResponse> getOrderDetail(int orderId) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/orders-s/detail/"+orderId.toString();

    OrderDetailResponse orderDetailResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      orderDetailResponseModel = OrderDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return orderDetailResponseModel;
  }

}
