import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';
import 'package:noor_e_quran/login/login_screen.dart';
import 'package:noor_e_quran/register/register_screen.dart';
import 'package:noor_e_quran/settings/settings_screen.dart';
import 'package:noor_e_quran/splash%20screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    systemNavigationBarColor: AppColors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   scrollbarTheme: ScrollbarThemeData(
      //     showTrackOnHover: true,
      //     interactive: true,
      //     thumbColor: MaterialStateProperty.all(AppColors.whiteColor),
      //   ),
      //   brightness: Brightness.light,
      //   fontFamily: "Sf Bold",
      //   primaryColor: AppColors.primaryColor,
      //   primarySwatch: AppColors.primaryMaterialColor,
      //   scaffoldBackgroundColor: Colors.white,
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(
      //         fontSize: 22,
      //         fontFamily: "Sf Bold",
      //         color: AppColors.primaryTextColor),
      //     headline2: TextStyle(
      //         fontSize: 20,
      //         fontFamily: "Sf Bold",
      //         color: AppColors.primaryTextColor),
      //   ),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: AppColors.whiteColor,
      //     centerTitle: true,
      //     elevation: 0,
      //     titleTextStyle: TextStyle(
      //         fontSize: 22,
      //         fontFamily: "Sf Bold",
      //         color: AppColors.primaryTextColor),
      //   ),
      // ),

      darkTheme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: AppColors.mDarkPrimaryColor,
          selectionColor: AppColors.darkPrimaryColor,
        ),
        fontFamily: "Sf Med",
        primaryColor: AppColors.primaryColor,
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        textTheme: const TextTheme(
        // ignore: deprecated_member_use
          headline1: TextStyle(
              fontSize: 25, fontFamily: "Sf Bold", color: AppColors.whiteColor),
          // ignore: deprecated_member_use
          headline2: TextStyle(
              fontSize: 20, fontFamily: "Sf Bold", color: AppColors.whiteColor),
        ),
        radioTheme: RadioThemeData(
            overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
            fillColor: MaterialStateProperty.all(AppColors.primaryColor)),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackgroundColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 22, fontFamily: "Sf Med", color: AppColors.whiteColor),
        ),
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/register", page: () => const RegisterScreen()),
        GetPage(name: "/main", page: () => const MainScreen()),
        GetPage(name: "/settings", page: () => const SettingsScreen()),
      ],
    );
  }
}
