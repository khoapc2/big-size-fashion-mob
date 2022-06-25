
class RegisterAccountRequest {
  String? phoneNumber;
  String? fullname;
  String? email;
  String? gender;
  int? weigth;
  int? heigth;

  RegisterAccountRequest(
      {this.phoneNumber,
      this.fullname,
      this.email,
      this.gender,
      this.weigth,
      this.heigth});

  RegisterAccountRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    fullname = json['fullname'];
    email = json['email'];
    gender = json['gender'];
    weigth = json['weigth'];
    heigth = json['heigth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['weigth'] = this.weigth;
    data['heigth'] = this.heigth;
    return data;
  }
}

class RegisterAccountResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  RegisterAccountResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  RegisterAccountResponse.fromJson(Map<String, dynamic> json) {
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

  Content({this.token});

  Content.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
