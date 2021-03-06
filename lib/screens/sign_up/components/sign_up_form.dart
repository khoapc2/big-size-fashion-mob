import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/blocs/register_account_bloc.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/customer_account/register_account_model.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/view_model/register_view_model.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../size_config.dart';
import '../../../twilio_verify.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var _twilio = locator.get<TwilioVerify>();


  final _storage = const FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  RegisterAccountBloc _registerAccoutBloc = new RegisterAccountBloc();
  String? name;
  String? email;
  String? gender;
  String? height;
  String? weight;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future<RegisterAccountResponse?> getRegisterResponse(RegisterAccountRequest registerRequestModel)
  async {
    RegisterAccountResponse? response;
   
    try {
      response = await _registerAccoutBloc.registerAccount(registerRequestModel);
    } catch (Exception) {
      print("Bị lỗi nè:"+Exception.toString());
      response = null;
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHeightFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildWeightFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                var registerRequestVM = RegisterAccountRequest(
                  email: email,
                  fullname: name,
                  gender: gender,
                  heigth: int.parse(height!),
                  phoneNumber: _twilio.getPhone(),
                  weigth: int.parse(weight!),
                  );
                var response = await getRegisterResponse(registerRequestVM);
                print("token key:"+response!.content!.token!);
               // _storage.write(key: "token", value: response!.content!.token);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildWeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      obscureText: true,
      onSaved: (newValue) => weight = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } 
        weight = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Cân nặng",
        hintText: "Nhập cân nặng (kg)",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/weight.svg"),
      ),
    );
  }

  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      obscureText: true,
      onSaved: (newValue) => height = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kInvalidHeght);
        } else if (value.length == 3) {
          removeError(error: kShortPassError);
        }
        height = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length > 3) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Chiều cao",
        hintText: "Nhập chiều cao (cm)",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/height.svg"),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Tên",
        hintText: "Nhập tên",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/name.svg"),
      ),
    );
  }

  TextFormField buildGenderFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => gender = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGenderNullError);
        } 
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kGenderNullError);
          return "";
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Giới tính",
        hintText: "Nhập giới tính",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/gender.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGenderNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kGenderNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Nhập Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/mail.svg"),
      ),
    );
  }
}
