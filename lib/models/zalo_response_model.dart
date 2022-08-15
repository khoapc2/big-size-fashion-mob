class ZaloPayResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  ZaloPayResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  ZaloPayResponse.fromJson(Map<String, dynamic> json) {
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
  int? returnCode;
  String? returnMessage;
  int? subReturnCode;
  String? subReturnMessage;
  String? orderUrl;
  String? zpTransToken;
  String? zpTransId;

  Content(
      {this.returnCode,
      this.returnMessage,
      this.subReturnCode,
      this.subReturnMessage,
      this.orderUrl,
      this.zpTransToken,
      this.zpTransId});

  Content.fromJson(Map<String, dynamic> json) {
    returnCode = json['return_code'];
    returnMessage = json['return_message'];
    subReturnCode = json['sub_return_code'];
    subReturnMessage = json['sub_return_message'];
    orderUrl = json['order_url'];
    zpTransToken = json['zp_trans_token'];
    zpTransId = json['zp_trans_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['return_code'] = this.returnCode;
    data['return_message'] = this.returnMessage;
    data['sub_return_code'] = this.subReturnCode;
    data['sub_return_message'] = this.subReturnMessage;
    data['order_url'] = this.orderUrl;
    data['zp_trans_token'] = this.zpTransToken;
    data['zp_trans_id'] = this.zpTransId;
    return data;
  }
}