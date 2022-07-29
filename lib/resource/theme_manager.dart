import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

ThemeData lightThemeData = ThemeData(
  backgroundColor: ColorManager.backGroundBlue,
  scaffoldBackgroundColor: ColorManager.backGroundBlue,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorManager.whiteColor,
    foregroundColor: ColorManager.foreGroundGrey,
  ),
  appBarTheme: AppBarTheme(
      elevation: 0,
      toolbarHeight: 50,
      titleSpacing: 0,
      foregroundColor: ColorManager.foreGroundGrey,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark)),

  primaryColor: ColorManager.mainBlue,
  iconTheme: const IconThemeData(color: ColorManager.darkGrey, size: 30),
  brightness: Brightness.light,
  primaryColorDark: ColorManager.darkGrey,
  primaryColorLight: ColorManager.darkGrey,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ColorManager.foreGroundBlue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
    foregroundColor: MaterialStateProperty.all(ColorManager.darkWhite),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    side: MaterialStateBorderSide.resolveWith((states) =>
        BorderSide(color: Colors.grey.withOpacity(0.4), width: 2.0)),
    foregroundColor: MaterialStateProperty.all(ColorManager.darkGrey),
  ))
);

class ColorManager {
  static const Color foreGroundGrey = Color(0xff939094);
  static const Color foreGroundBlue = Color(0xff2D8EFF);

  static const Color backGroundBlue = Color(0xffe5f2fd);

  static const Color mainBlue = Color(0xff2666CF);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xFF2C3333);
  static const Color lightBlue = Color(0xFF30AADD);
  static const Color darkWhite = Color(0xFFEEEEEE);
  static const Color darkGrey = Color.fromRGBO(64, 64, 64, 1);
  static const Color lightGrey = Color.fromRGBO(175, 175, 175, 1.0);
}

// final TextTheme _textTheme = TextTheme(
//   headline1: GoogleFonts.poppins(
//       fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
//   headline2: GoogleFonts.poppins(
//       //used
//       fontSize: 22,
//       fontWeight: FontWeight.w500,
//       color: ColorManager.foreGroundGrey),
//   headline3: GoogleFonts.poppins(
//       //used
//       fontSize: 14,
//       fontWeight: FontWeight.w500,
//       color: ColorManager.whiteColor),
//   headline4: GoogleFonts.roboto(
//       //used
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       color: ColorManager.foreGroundGrey),
//   caption: GoogleFonts.alegreyaSans(
//       //used
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.4,
//       color: ColorManager.blackColor),

//   subtitle1: GoogleFonts.alegreyaSans(
//       fontSize: 16,
//       fontWeight: FontWeight.w700,
//       color: ColorManager.blackColor),
//   subtitle2: GoogleFonts.alegreyaSans(
//       fontSize: 16,
//       fontWeight: FontWeight.w700,
//       color: ColorManager.foreGroundBlue),

//   // here
//   button: GoogleFonts.alegreyaSans(fontSize: 16, fontWeight: FontWeight.w500),
//   overline: GoogleFonts.alegreyaSans(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 1.5,
//       color: Colors.black),
// );
