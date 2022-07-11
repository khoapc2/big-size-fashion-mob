class AddAddressResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  AddAddressResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  AddAddressResponse.fromJson(Map<String, dynamic> json) {
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
  int? addressId;
  String? receiverName;
  String? receiveAddress;
  String? receiverPhone;

  Content(
      {this.addressId,
      this.receiverName,
      this.receiveAddress,
      this.receiverPhone});

  Content.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    receiverName = json['receiver_name'];
    receiveAddress = json['receive_address'];
    receiverPhone = json['receiver_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['receiver_name'] = this.receiverName;
    data['receive_address'] = this.receiveAddress;
    data['receiver_phone'] = this.receiverPhone;
    return data;
  }
}