class CancelOrderResponse {
  bool? content;
  Error? error;
  bool? isSuccess;
  String? responseTime;

  CancelOrderResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  CancelOrderResponse.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
}

class Error {
  int? code;
  String? type;
  String? message;

  Error({this.code, this.type, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}