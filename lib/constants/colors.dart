
import 'package:flutter/material.dart';

class AppColors {

  static const TextStyle titleStyle = TextStyle(fontSize: 25, color: AppColors.primaryTextColor, fontFamily: "Sf Bold");
  static const TextStyle appBarWhiteStyle = TextStyle(color: AppColors.whiteColor, fontFamily: "Sf Bold");
  static const TextStyle whiteStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: AppColors.whiteColor, fontFamily: "Sf Med");
  static  TextStyle greyStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Colors.grey.shade300, fontFamily: "Sf Med");
  static const TextStyle whiteTitleStyle = TextStyle(fontSize: 25, color: AppColors.whiteColor, fontFamily: "Sf Bold");

  static const Color primaryColor =  Color(0xff03AA77);
  static const Color darkPrimaryColor =  Color(0xff01855d);
  static const Color mDarkPrimaryColor =  Color(0xff016b4b);

  static const Color primaryTextColor =  Color(0xff1C1F28);
  static const Color whiteTextColor =  Colors.white;
  static const Color greyTextColor =  Color(0xff8F92A1);

  static const Color mDarkBackgroundColor = Color(0xff1F1B24);
  static const Color darkBackgroundColor = Color(0xff1C1F28);

  static const Color primaryIconColor =  Color(0xff242424);
  static  Color darkGreyColor =  Colors.grey.shade800;
  static Color lightGreyColor = Colors.grey.shade200;

  static const Color successColor =  Color(0xff04cd62);

  static const Color iconBackgroundColor = Color(0xffdfdfe1);
  static const Color inputTextBorderColor =  Color.fromRGBO(19, 103, 33 , 1);
  static const Color hintColor =  Color.fromRGBO(114, 114, 114, 1);

  static const Color textFieldDefaultFocus =  Color(0xfff5f5f6);
  static const Color textFieldDefaultBorderColor  =  Color(0xfffDFDFE1);

  static const Color primaryButtonColor =  Color(0xff242424);

  static const Color alertColor =  Colors.red;
  static const Color whiteColor =  Color(0xffffffff);

  static const Color focusUnderLineColor =  Color(0xff373737);
  static const Color dividedColor =  Color(0xff373737);
  static const Color grayColor =  Color(0xffdfdfe1);
  static Color liteGrayColor =  Colors.grey.shade400;

  static const Color dialogAlertBackgroundColor =  Color(0xff262938);
  static const Color lightGrayColor =  Color(0xffA5A5A5);

  static const Color transparent =  Colors.transparent;


  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xff03AA77,
    <int, Color>{
      50: Color(0xff03AA77),
      100: Color(0xff03AA77),
      200: Color(0xff03AA77),
      300: Color(0xff03AA77),
      400: Color(0xff03AA77),
      500: Color(0xff03AA77),
      600: Color(0xff03AA77),
      700: Color(0xff03AA77),
      800: Color(0xff03AA77),
      900: Color(0xff03AA77),
    },
  );

}