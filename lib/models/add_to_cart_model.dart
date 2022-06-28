class AddToCartRequest {
  int? productDetailId;
  int? quantity;

  AddToCartRequest({this.productDetailId, this.quantity});

  AddToCartRequest.fromJson(Map<String, dynamic> json) {
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

class AddToCartResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  AddToCartResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  int? productDetailId;
  int? quantity;

  Content({this.customerId, this.productDetailId, this.quantity});

  Content.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    productDetailId = json['product_detail_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['product_detail_id'] = this.productDetailId;
    data['quantity'] = this.quantity;
    return data;
  }
}