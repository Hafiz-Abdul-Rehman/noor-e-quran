import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noor_e_quran/constants/colors.dart';

class Utils{
  static toastMessage(String message, Color color){
    Fluttertoast.showToast(
        fontSize: 16,
        textColor: AppColors.whiteColor,
        backgroundColor: color,
        msg: message.toString());
  }
}