import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(
          //   'Settings',
          //   style: AppColors.appBarWhiteStyle,
          // ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            ),
            onPressed: () => Get.offNamed("/main"),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Center(
            child: Text(
          "Settings Screen",
          style: AppColors.whiteStyle,
        )),
      ),
    );
  }
}
