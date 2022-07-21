class UpdateProfileResponseModel {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  UpdateProfileResponseModel(
      {this.content, this.error, this.isSuccess, this.responseTime});

  UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? uid;
  String? fullname;
  String? phoneNumber;
  String? email;
  Null? birthday;
  String? gender;
  Null? pinCode;
  int? weigth;
  int? heigth;

  Content(
      {this.uid,
      this.fullname,
      this.phoneNumber,
      this.email,
      this.birthday,
      this.gender,
      this.pinCode,
      this.weigth,
      this.heigth});

  Content.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullname = json['fullname'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    birthday = json['birthday'];
    gender = json['gender'];
    pinCode = json['pin_code'];
    weigth = json['weigth'];
    heigth = json['heigth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['fullname'] = this.fullname;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['pin_code'] = this.pinCode;
    data['weigth'] = this.weigth;
    data['heigth'] = this.heigth;
    return data;
  }
}