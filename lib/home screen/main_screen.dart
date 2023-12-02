import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:noor_e_quran/audio%20quran%20screen/qari_list_screen.dart';
import 'package:noor_e_quran/audio%20quran%20screen/quran_audio.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/home_screen.dart';
import 'package:noor_e_quran/prayer/prayer_screen.dart';
import 'package:noor_e_quran/quran_screen/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  int index = 0;
  // List<Widget> _widgetsList = [
  //   HomeScreen(),
  //   QuranScreen(),
  //   QuranAudioScreen(),
  //   PrayerScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("HomePage", style: Theme.of(context).textTheme.headline2,),
        //   automaticallyImplyLeading: false,
        //   bottomOpacity: 0,
        // ),
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              index = page;
            });
          },
          children: const [
            HomeScreen(),
            QuranScreen(),
            QariListScreen(),
            PrayerScreen(),
          ],
        ),

        bottomNavigationBar: CustomNavigationBar(
          currentIndex: index,
          // isFloating: true,
          borderRadius: Radius.circular(0),
          bubbleCurve: Curves.easeIn,
          strokeColor: AppColors.darkPrimaryColor,
          scaleCurve: Curves.easeOut,
          selectedColor: AppColors.whiteColor,
          unSelectedColor: AppColors.whiteColor.withOpacity(0.5),
          // unSelectedColor: AppColors.mDarkPrimaryColor.withOpacity(0.6),
          scaleFactor: 0.5,
          iconSize: 30.0,
          elevation: 4,
          onTap: (value) {
            index = value;
            pageController.jumpToPage(index);
          },
          backgroundColor: AppColors.dialogAlertBackgroundColor,
          // backgroundColor: Color(0xff040307),
          items: [
            CustomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill)),
            CustomNavigationBarItem(icon: Icon(FlutterIslamicIcons.solidQuran)),
            CustomNavigationBarItem(
                icon: Icon(FlutterIslamicIcons.solidMuslim)),
            CustomNavigationBarItem(
                icon: Icon(FlutterIslamicIcons.solidMosque)),
          ],
        ),
      ),
    );
  }
}

Future<bool> _onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.mDarkBackgroundColor,
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Center(
          child: Text(
            "Sure?",
            style: AppColors.appBarWhiteStyle.copyWith(
              fontSize: 22,
            ),
          ),
        ),
        content: Text(
          "Are you Sure to exit the Noor e Quran?",
          textAlign: TextAlign.center,
          style: AppColors.whiteStyle.copyWith(
            fontSize: 21,
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 130,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.alertColor)),
              child: Text(
                "Yes",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Container(
            height: 50,
            width: 130,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor)),
              child: Text(
                "No",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ),
        ],
      );
    },
  );
  return exitApp;
}
