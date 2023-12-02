import 'package:flutter/material.dart';
import 'package:noor_e_quran/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Color focusedColor;
  final bool obscure;
  final Icon preIcon;
  Widget button;
  TextInputType inputType;
  final bool isAutoCorrect;
  final FormFieldValidator onValidator;
  final dynamic onSave;

  CustomTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      this.obscure = false,
      required this.preIcon,
      this.button = const SizedBox(),
      required this.inputType,
      required this.onValidator,
      this.isAutoCorrect = false,
      required this.focusedColor,
      this.onSave})
      : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // color: AppColors.mDarkBackgroundColor
      ),
      child: TextFormField(
        autocorrect: isAutoCorrect,
        keyboardType: inputType,
        obscureText: obscure,
        onSaved: onSave,
        cursorColor: AppColors.whiteColor,
        style: AppColors.whiteStyle.copyWith(fontSize: 19),
        decoration: InputDecoration(
          focusColor: focusedColor,
          hintStyle: AppColors.whiteStyle
              .copyWith(fontSize: 19, color: Colors.white.withOpacity(0.4)),
          hintText: hint,
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.2),
              width: 0.7,
            ),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.alertColor,
              width: 0.7,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.2),
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
          prefixIcon: preIcon,
          prefixIconColor: AppColors.whiteColor,
          suffixIcon: button,
        ),
      ),
    );
  }
}
