import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../../service/firebase_messaging.dart';
import '../../../service/storage_service.dart';

class Body extends StatelessWidget {
  StorageService _storageService = new StorageService();
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child:  Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Đăng nhập thành công",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Về trang chủ",
            press: () async {
              showLoading(context);
              await HandleMessagingFirebase.receiveMessagingFromServer(
                         (await _storageService.readSecureData("phoneNumber")).toString());
              // print((await _storageService.readSecureData("phoneNumber")).toString());
               
               Navigator.pop(context);
               Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false);
            },
          ),
        ),
        Spacer(),
      ],
    ));
   
  }

showLoading(context) {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text(
                    "Đang xử lí...",
                    style: TextStyle(fontFamily: "QuicksandMedium"),
                  )
                ],
              ),
            ),
          );
        });
  }

}
