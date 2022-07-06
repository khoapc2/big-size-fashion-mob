class GetNearestStoreModel {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  GetNearestStoreModel(
      {this.content, this.error, this.isSuccess, this.responseTime});

  GetNearestStoreModel.fromJson(Map<String, dynamic> json) {
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
  int? storeId;
  double? shippingFee;

  Content({this.storeId, this.shippingFee});

  Content.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    shippingFee = json['shipping_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['shipping_fee'] = this.shippingFee;
    return data;
  }
}