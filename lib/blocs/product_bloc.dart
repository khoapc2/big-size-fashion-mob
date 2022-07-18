
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/get_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_list_product_by_category_model.dart';
import 'package:shop_app/models/get_popular_product.dart';
import 'package:shop_app/models/product_model.dart';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/detail_product_id_model.dart';
import '../locator.dart';
import '../main.dart';
import '../twilio_verify.dart';

class ProductBloc {

  Future<ProductResponseModel> getListProductByName(String? searchValue, int page) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products"+"?ProductName="+searchValue!+"&Status=true"+"&PageNumber="+page.toString();

    ProductResponseModel productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<ProductResponseModel> getAllProducts(int page) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products"+"?Status=true"+"&PageNumber="+page.toString();

    ProductResponseModel productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<GetListPopularProductResponse> getPoularProducts() async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products/best-seller";

    GetListPopularProductResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = GetListPopularProductResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  // Future<GetQuantityReponse> getQuantity(GetQuantityRequest request) async {
  //   String link = "https://20.211.17.194/";
  //   String url = link + "api/v1/products/quantity?"+"ProductId="+request.productId.toString()+
  //   "&ColourId="+request.colourId.toString()+"&SizeId="+request.sizeId.toString()+"&StoreId=1";

  //   GetQuantityReponse productResponseModel;  

  //   final response = await http.get(Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       });

  //   if(response.statusCode == 200){
  //     productResponseModel = GetQuantityReponse.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(Exception);
  //   }
  //   return productResponseModel;
  // }

Future<GetFitProductByCategoryResponse> getFitProductsByCategory(String token) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products/get-quantity-fit-product-by-category";

    GetFitProductByCategoryResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ token
        });

    if(response.statusCode == 200){
      productResponseModel = GetFitProductByCategoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<GetListProductByCategoryResponse> getListProductByCategory(String? categoryName, int page) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products"+"?Category="+categoryName!+"&Status=true"+"&PageNumber="+page.toString();

    GetListProductByCategoryResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if(response.statusCode == 200){
      productResponseModel = GetListProductByCategoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }

  Future<GetListFitProductByCategoryResponse> getListFitProductByCategory(String? categoryName, int page, String token) async {
    String link = "https://20.211.17.194/";
    String url = link + "api/v1/products/fit-with-customer"+"?CategoryName="+categoryName!+"&PageNumber="+ page.toString();

    GetListFitProductByCategoryResponse productResponseModel;  

    final response = await http.get(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer "+ token
        });

    if(response.statusCode == 200){
      productResponseModel = GetListFitProductByCategoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }
}




 