import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/screens/order_history/list_order_screen.dart';
import 'package:shop_app/screens/profile/userprofile/userprofile_screen.dart';
import 'package:shop_app/screens/setting/setting_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';



class Body extends StatelessWidget {
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Tài khoản",
            icon: "assets/icons/User Icon.svg",
            press: () =>
            Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => UserProfileScreen()),
                    ),
                //UserProfileScreen
          ),
          // ProfileMenuForPNG(
          //   text: "Order Status",
          //   icon: "assets/icons/orderHistory.png",
          //   press: () => Navigator.push(
          //               context,
          //             MaterialPageRoute(builder: (context) => ListOrderScreen()),
          //           ),
          // ), Code có thể mở

          // ProfileMenuForPNG(
          //   text: "Order History",
          //   icon: "assets/icons/orderHistory.png",
          //   press: () => 
          //      Navigator.push(
          //               context,
          //             MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
          //           )
          //   ,
          // ),
          ProfileMenu(
            text: "Thông báo",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài đặt",
            icon: "assets/icons/Settings.svg",
            press: () =>
                {Navigator.pushNamed(context, SettingScreen.routeName)},
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",

            press: () async  {
              await storage.deleteAll();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => SignInScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
