class UpdateProfileRequestModel {
  String? fullname;
  String? email;
  String? birthday;
  bool? gender;
  int? weigth;
  int? heigth;

  UpdateProfileRequestModel(
      {this.fullname,
      this.email,
      this.birthday,
      this.gender,
      this.weigth,
      this.heigth});

  UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    birthday = json['birthday'];
    gender = json['gender'];
    weigth = json['weigth'];
    heigth = json['heigth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['weigth'] = this.weigth;
    data['heigth'] = this.heigth;
    return data;
  }
}