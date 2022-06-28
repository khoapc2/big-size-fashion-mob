class StoreResponseModel {
  List<Content>? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  StoreResponseModel({this.content, this.error, this.isSuccess, this.responseTime});

  StoreResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? storeId;
  String? storeAddress;
  String? storePhone;
  bool? status;

  Content({this.storeId, this.storeAddress, this.storePhone, this.status});

  Content.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeAddress = json['store_address'];
    storePhone = json['store_phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_address'] = this.storeAddress;
    data['store_phone'] = this.storePhone;
    data['status'] = this.status;
    return data;
  }
}