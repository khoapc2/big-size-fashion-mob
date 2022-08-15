class GetQuantityByProductDetail {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  GetQuantityByProductDetail(
      {this.content, this.error, this.isSuccess, this.responseTime});

  GetQuantityByProductDetail.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    error = json['error'];
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['error'] = this.error;
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
}

class Content {
  int? productDetailId;
  int? quantity;

  Content({this.productDetailId, this.quantity});

  Content.fromJson(Map<String, dynamic> json) {
    productDetailId = json['product_detail_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_detail_id'] = this.productDetailId;
    data['quantity'] = this.quantity;
    return data;
  }
}