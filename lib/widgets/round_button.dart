import 'package:flutter/material.dart';
import 'package:noor_e_quran/constants/colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget bIcon;
  final Color bColor;

  RoundButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.bIcon,
      this.bColor = AppColors.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppColors.appBarWhiteStyle.copyWith(fontSize: 21),
              ),
              bIcon,
            ],
          ),
        ),
      ),
    );
  }
}

class RoundButtonTwo extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  // final Widget bIcon;
  final Color bColor;
  final Widget conChild;
  RoundButtonTwo(
      {Key? key,
      required this.onTap,
      this.title = '',
      this.bColor = AppColors.primaryColor,
      required this.conChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bColor,
          ),
          child: conChild),
    );
  }
}

class SpecialLoginButton extends StatelessWidget {
  final Color bgColor;
  final Widget iconW;
  final String title;

  SpecialLoginButton({
    super.key,
    required this.bgColor,
    required this.iconW,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.whiteColor.withOpacity(0.1),
        ),
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: iconW),
    );
  }
}
