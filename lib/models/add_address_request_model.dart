class AddAddressRequest {
  String? receiverName;
  String? receiveAddress;
  String? receiverPhone;

  AddAddressRequest(
      {this.receiverName, this.receiveAddress, this.receiverPhone});

  AddAddressRequest.fromJson(Map<String, dynamic> json) {
    receiverName = json['receiver_name'];
    receiveAddress = json['receive_address'];
    receiverPhone = json['receiver_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiver_name'] = this.receiverName;
    data['receive_address'] = this.receiveAddress;
    data['receiver_phone'] = this.receiverPhone;
    return data;
  }
}