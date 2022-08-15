import 'package:flutter/cupertino.dart';

class GetProductDetailResponse {
  int? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  GetProductDetailResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  GetProductDetailResponse.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    error = json['error'];
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['error'] = this.error;
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
}

class GetProductDetailIdRequest{
  int? productId;
  int? colourId;
  Color? colourCode;
  int? sizeId;
  String? sizeName;
  int quantity = 1;
  int total = 0;
}
