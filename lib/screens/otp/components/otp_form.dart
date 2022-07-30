import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/blocs/login_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/customer_account/login_response_model.dart';

import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

import '../../../constants.dart';
import '../../../locator.dart';
import '../../../token.dart';
import '../../../twilio_verify.dart';
import '../../sign_up for old customer/sign_up_screen.dart';
import '../../sign_up/sign_up_screen.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

LoginResponseModel? response;

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  String? _number1;
  String? _number2;
  String? _number3;
  String? _number4;
  String? _number5;
  String? _number6;

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  LoginBloc _loginBloc = new LoginBloc();

  var _twilio = locator.get<TwilioVerify>();
  var _token = locator.get<Token>();
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

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

    Future<LoginResponseModel?> getLoginResponse(String phoneNumber)
  async {
    
      print("getLoginResponse is running");
    LoginResponseModel? response;
    
    try {
      response = await _loginBloc.login(phoneNumber);
    } catch (Exception) {
      
      print("lỗi nè:"+Exception.toString());
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
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  onSaved: (newValue) {
                    _number1 = newValue;
                  },
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  onSaved: (newValue) => _number2 = newValue!,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  onSaved: (newValue) => _number3 = newValue,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  onSaved: (newValue) => _number4 = newValue,
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Tiếp tục",
            press: () async {
              LoginResponseModel? loginResponse = await getLoginResponse(_twilio.getPhone()!);
if (_formKey.currentState!.validate()) {
 _formKey.currentState!.save();
                var twilioPhoneVerify = _twilio.getTwilioPhoneVerify();
                var code = _number1! +
                    _number2! +
                    _number3! +
                    _number4!;
                               var twilioResponse = await twilioPhoneVerify.verifySmsCode(
                    phone: "+84"+_twilio.getPhone()!, code: code);
                if(_twilio.getTimeLeft()!){
                    if (twilioResponse.successful!) {
                  if (twilioResponse.verification!.status == VerificationStatus.approved) {

                    /////
                    if(loginResponse!.content!.isNewCustomer == true){
               Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
              }
              else{
                _storage.write(key: "token", value: loginResponse.content!.token);
                _storage.write(key: "phoneNumber", value: _twilio.getPhone());
                  if(loginResponse.content!.isHasWeightHeight == false){
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => SignUpScreenForOldCustomer()),
                    );
                }
                else{
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
                    ///
                  } 
                } else {
                    removeError(error: kExpiredTime);
                    addError(error: kInvalidCode);
                }
                }
                else{
                  print("Mã số không hợp lệ");
                  removeError(error: kInvalidCode);
                  addError(error: kExpiredTime);
                }
                
                              print("Số điện thoại nè"+_twilio.getPhone()!);
}else{
                  removeError(error: kInvalidCode);
                  addError(error: kExpiredTime);
}

            } //Code sẽ mở

Navigator.pushNamed(context, LoginSuccessScreen.routeName);

  
            },
          )
        ],
      ),
    );
  }
}
