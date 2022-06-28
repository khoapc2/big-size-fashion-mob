import 'dart:convert';

import 'package:shop_app/models/detail_product_model.dart';
import 'package:shop_app/models/product_model.dart';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/detail_product_id_model.dart';
import '../locator.dart';
import '../twilio_verify.dart';

class DetailProductService {
   var _twilio = locator.get<TwilioVerify>();

  Future<DetailProductResponse> getDetailProduct(int productId) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products/"+productId.toString();

    DetailProductResponse detailProductResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      detailProductResponseModel = DetailProductResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return detailProductResponseModel;
  }

  Future<GetProductDetailResponse> getProductDetailId(GetProductDetailIdRequest request) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/product-details?"+"ProductId="+request.productId.toString()+
    "&ColourId="+request.colourId.toString()+"&SizeId="+request.sizeId.toString();

    GetProductDetailResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = GetProductDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

}