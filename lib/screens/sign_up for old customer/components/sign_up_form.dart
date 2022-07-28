import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/blocs/customer_bloc.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/update_profile_request_model.dart';
import 'package:shop_app/models/update_profile_response_model.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/service/storage_service.dart';


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
  CustomerBloc _customerBloc = new CustomerBloc();
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? gender;
  String? height;
  String? weight;
  bool remember = false;
  final List<String?> errors = [];
  String genderSelected = 'Nam';

  var items = [   
    'Nam',
    'Nữ',
  ];
  
  final StorageService _storageService = StorageService();

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

  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  Future<UpdateProfileResponseModel?> updateProfile(UpdateProfileRequestModel request, String token)
  async {
    try {
      return await _customerBloc.updateProfile(request, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }

   

  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, snapshot){
        if(snapshot.hasData){
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
                var registerRequestVM = UpdateProfileRequestModel(
                  email: email,
                  fullname: name,
                  gender: gender == "Nam" ? true : false,
                  heigth: int.parse(height!),
                  weigth: int.parse(weight!),
                  birthday: "null"
                  );
                // CustomerViewModel? registerViewModel = new CustomerViewModel();
                 updateProfile(registerRequestVM, snapshot.data!);
               // _storage.write(key: "token", value: response!.content!.token);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
        }
        else{
          return _buildProgressIndicator();
        }
      });
    
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
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
        labelText: "Cân nặng (kg)",
        hintText: "90",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: 
         Container(
          padding: EdgeInsets.only(left: 30.0),
          child: 
        CustomSurffixIcon(svgIcon: "assets/icons/weight.svg"),
        ),
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
        labelText: "Chiều cao (cm)",
        hintText: "183",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: 
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: CustomSurffixIcon(svgIcon: "assets/icons/height.svg"),
        ),
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
        hintText: "Nguyễn Văn A",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: 
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: 
        CustomSurffixIcon(svgIcon: "assets/icons/name.svg"),
        ),
      ),
    );
  }

  Widget buildGenderFormField() {
    return 
    
    // TextFormField(
    //   keyboardType: TextInputType.emailAddress,
    //   onSaved: (newValue) => gender = newValue,
    //   onChanged: (value) {
    //     if (value.isNotEmpty) {
    //       removeError(error: kGenderNullError);
    //     } 
    //     return null;
    //   },
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       addError(error: kGenderNullError);
    //       return "";
    //     } 
    //     return null;
    //   },
    //   decoration: InputDecoration(
    //     labelText: "Giới tính",
    //     hintText: "Nam",
    //     // If  you are using latest version of flutter then lable text and hint text shown like this
    //     // if you r using flutter less then 1.20.* then maybe this is not working properly
    //     floatingLabelBehavior: FloatingLabelBehavior.always,
    //     suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/gender.svg"),
    //   ),
    // );
     Container(
    //   width: SizeConfig.screenWidth,
    //   height: getProportionateScreenHeight(90),
    //   padding: EdgeInsets.only(left: 40,top:10),
    //   decoration: 
    //   BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
    //     border: Border.all(
          
    //   color: Colors.black,
    // ),
    //   ),

    //     child: DropdownButton<String>(
    //   value: genderSelected,
    //   items: items.map((String items) {
      
    //     return DropdownMenuItem(
    //       value: items,
    //       child: Text(items));
    // } ).toList(), onChanged: (String? newValue) {
    //   setState(() {
    //     genderSelected = newValue!;
    //   });
    // }),
  height: getProportionateScreenHeight(90),
    child: InputDecorator(

       decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.only(left: 30.0),
          child: 
        CustomSurffixIcon(svgIcon: "assets/icons/gender.svg"),
        ),
      labelText: 'Giới tính',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      
    ),
    child: DropdownButton<String>(
      value: genderSelected,
      items: items.map((String items) {
      
        return DropdownMenuItem(
          value: items,
          child: Text(items));
    } ).toList(), onChanged: (String? newValue) {
      setState(() {
        genderSelected = newValue!;
      });
    }),
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
        hintText: "An@gmail.com",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: 
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: 
        CustomSurffixIcon(svgIcon: "assets/icons/email.svg"),
        ),
      ),
    );
  }
}
