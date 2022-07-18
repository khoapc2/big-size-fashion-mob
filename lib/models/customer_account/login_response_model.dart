class LoginResponseModel {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  LoginResponseModel(
      {this.content, this.error, this.isSuccess, this.responseTime});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  bool? isNewCustomer;
  bool? isHasWeightHeight;

  Content({this.token, this.isNewCustomer, this.isHasWeightHeight});

  Content.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isNewCustomer = json['is_new_customer'];
    isHasWeightHeight = json['is_has_weight_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['is_new_customer'] = this.isNewCustomer;
    data['is_has_weight_height'] = this.isHasWeightHeight;
    return data;
  }
}