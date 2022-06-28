class ListCartResponse {
  List<Content>? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  ListCartResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  ListCartResponse.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    error = json['error'];
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
}

class Content {
  String? productName;
  int? productDetailId;
  double? productPrice;
  double? productPromotion;
  String? productImage;
  int? quantity;

  void setQuantity(int quantity){
    this.quantity = quantity;
  }

  Content(
      {this.productName,
      this.productDetailId,
      this.productPrice,
      this.productPromotion,
      this.productImage,
      this.quantity});

  Content.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productDetailId = json['product_detail_id'];
    productPrice = json['product_price'];
    productPromotion = json['product_promotion'];
    productImage = json['product_image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_detail_id'] = this.productDetailId;
    data['product_price'] = this.productPrice;
    data['product_promotion'] = this.productPromotion;
    data['product_image'] = this.productImage;
    data['quantity'] = this.quantity;
    return data;
  }
}

class AddToCarRequest {
  int? productDetailId;
  int? quantity;

  AddToCarRequest({this.productDetailId, this.quantity});

  AddToCarRequest.fromJson(Map<String, dynamic> json) {
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