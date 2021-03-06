//import 'dart:js';



import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/pincode/pincode_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/profile/userprofile/userprofile_screen.dart';
import 'package:shop_app/screens/profile/userprofile_edit/profileedit_screen.dart';
import 'package:shop_app/screens/setting/setting_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/signup_userprofile/signup_profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/waiting_home/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  UserProfileScreen.routeName: (context) => UserProfileScreen(),
  UserProfileEditScreen.routeName: (context) => UserProfileEditScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  PincodeScreen.routeName: (context) => PincodeScreen(),
  SignUpUserProfileScreen.routeName: (context) => SignUpUserProfileScreen(),
  WaitngHomeScreen.routeName: (context) => WaitngHomeScreen(),
  //PaymentScreen.routeName: (context) => PaymentScreen()
};
