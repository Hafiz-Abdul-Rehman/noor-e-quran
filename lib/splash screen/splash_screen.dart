import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/controllers/login_controllers.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';
import 'dart:async';

import 'package:noor_e_quran/onborading_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool alreadyUsed = false;
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
    print("Fetching...");
  }

  LoginController loginController = LoginController();

  @override
  void initState() {
    getData();
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (alreadyUsed) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => loginController.handleAuthState(),
            ));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ));
      }

      // return loginController.handleAuthState();
    }
        // () => Get.offNamed('/login'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 110,
                      child: const Center(
                        child: Image(
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                          image: AssetImage("assets/images/Noor_Logo.png"),
                        ),
                      ),
                    ),
                    AnimatedTextKit(
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        FadeAnimatedText("Light of Quran",
                            textStyle: AppColors.whiteStyle.copyWith(
                                // fontWeight: FontWeight.bold,
                                )),
                        // RotateAnimatedText("Light of Quran",
                        //   textStyle: AppColors.whiteStyle.copyWith(
                        //         // fontWeight: FontWeight.bold,
                        //       )
                        // ),
                      ],
                    ),
                    // Center(
                    //   child: Text("Light of Quran", style: AppColors.whiteStyle.copyWith(
                    //     fontWeight: FontWeight.bold,
                    //   ),),
                    // ),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.06,
                    child: Image(
                      image: AssetImage('assets/images/mosque-white.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
