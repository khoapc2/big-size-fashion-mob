import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';


const kPrimaryColor = Color(0xFFFF7643);
//const kPrimaryColor = Color.fromARGB(255, 0, 0, 0);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,

  colors: [
    Color.fromARGB(255, 62, 175, 255),
    Color.fromARGB(255, 67, 152, 255)
  ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneNumberValidatorRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
//const String kPhoneNullError = "Vui lòng nhập SĐT của bạn";
const String kNameNullError = "Vui lòng nhập tên";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidPhoneError = "Làm ơn nhập đúng số điện thoại";
const String kPassNullError = "Vui lòng nhập cân nặng";
const String kInvalidHeght = "Vui lòng nhập chiều cao";
const String kShortPassError = "Vui lòng nhập đúng chiều cao";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Làm ơn nhập số điện thoại";
const String kAddressNullError = "Please Enter your address";
const String kInvalidCode = "Nhập sai mã code";
const String kExpiredTime = "Hết thời gian vui lòng gửi lại mã code";
const String kGenderNullError = "Vui lòng nhập giới tính";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
