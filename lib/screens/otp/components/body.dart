import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

import '../../../locator.dart';
import '../../../twilio_verify.dart';
import '../otp_screen.dart';
import 'otp_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _twilio = locator.get<TwilioVerify>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "XÁC THỰC SĐT",
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text("We sent your code to +1 898 860 ***"),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () async {
                  
                  var twilioPhoneVerify = _twilio.getTwilioPhoneVerify();
                  print("Code mới-Làm ơn in cái số điện thoại ra dùm 1 cái"+_twilio.getPhone()!);
                  var twilioResponse = await twilioPhoneVerify
                      .sendSmsCode(_twilio.getPhone()!);
                      print(_twilio.getPhone());
                  if (twilioResponse.successful!) {
                    print("Gửi thành công");
                  } else {
                    //print(twilioResponse.errorMessage);
                    print(twilioResponse.errorMessage);
                    print("Gửi thất bại");
                  }
                  Navigator.pushNamed(context, OtpScreen.routeName);
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
            tween: Tween(begin: 30.0, end: 0.0),
            duration: Duration(seconds: 30),
            builder: (_, dynamic value, child) {
              if (value.toInt() == 0) {
                _twilio.setTimeLeft(false);
              } else {
                _twilio.setTimeLeft(true);
              }
              return Text(
                "00:${value.toInt()}",
                style: TextStyle(color: kPrimaryColor),
              );
            }),
      ],
    );
  }
}
