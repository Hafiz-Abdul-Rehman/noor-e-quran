import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/ayat_of_the_day_model.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/controllers/login_controllers.dart';
import 'package:noor_e_quran/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Translation { urdu, hindi, english }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _apiServices = ApiServices();

  Future setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyUsed', true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  AyaOfTheDay? data;
  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    // HijriCalendar.setLocal("ar");
    var _hijriDate = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat("EEE, d MMM yyyy");
    var formatted = format.format(day);
    var mSize = MediaQuery.of(context).size;
    _apiServices.getAyaOfTheDay().then((value) => data = value);
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: const [
            SizedBox(
              width: 16,
            ),
            CircleAvatar(
              radius: 17,
              backgroundColor: AppColors.transparent,
              backgroundImage: AssetImage(
                "assets/images/noor-logo.png",
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: AppColors.appBarWhiteStyle,
        ),
        centerTitle: false,
        actions: [

          PopupMenuButton(
              splashRadius: 35,
              // padding: EdgeInsets.all(20),
              color: AppColors.dialogAlertBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              icon: const Icon(
                Icons.more_horiz,
                color: AppColors.whiteColor,
                size: 30,
              ),
              itemBuilder: (context) => <PopupMenuItem>[
                    PopupMenuItem(
                        onTap: () async {
                        },
                        value: '1',
                        child: Text(
                          'Rate Us!',
                          style: AppColors.whiteStyle.copyWith(fontSize: 18),
                        )),
                PopupMenuItem(
                    onTap: () async {
                      await loginController.signOutFromGoogle();
                    },
                    value: '2',
                    child: Text(
                      'Log out',
                      style: AppColors.whiteStyle.copyWith(fontSize: 18),
                    )),
                  ]),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.15,
                      image: AssetImage("assets/images/bg_para.png")
                    ),
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor),
                  // height: mSize.height*0.22,
                  width: mSize.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Noor e Quran",
                          style:
                              AppColors.whiteTitleStyle.copyWith(fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hijri Date: ",
                              style: AppColors.whiteTitleStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${_hijriDate.hDay.toString()} ${_hijriDate.longMonthName}, ${_hijriDate.hYear.toString()} AH",
                              style: AppColors.whiteStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shams Date: ",
                              style: AppColors.whiteTitleStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${formatted.toString()}",
                              style: AppColors.whiteStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Aya of the Day",
                style: AppColors.whiteTitleStyle
                    .copyWith(height: 1.5, fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FutureBuilder<AyaOfTheDay>(
                  future: _apiServices.getAyaOfTheDay(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Icon(Icons.sync_problem);
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        return SpinKitThreeBounce(
                          size: 25,
                          color: AppColors.whiteColor,
                        );
                      case ConnectionState.done:
                        return Column(
                          children: [
                            Container(
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //       opacity: 0.15,
                              //       fit: BoxFit.cover,
                              //       image: AssetImage(
                              //         "assets/images/bg_para.png",
                              //       )),
                              //   borderRadius: BorderRadius.circular(20),
                              //   color: AppColors.primaryColor,
                              // ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryColor,),
                              width: mSize.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextSelectionTheme(
                                      data: const TextSelectionThemeData(
                                          selectionColor:
                                              AppColors.darkPrimaryColor,
                                          selectionHandleColor:
                                              AppColors.whiteColor),
                                      child: SelectableText(
                                        snapshot.data!.arText!,
                                        textAlign: TextAlign.center,
                                        style: AppColors.whiteTitleStyle
                                            .copyWith(
                                                fontSize: 22,
                                                fontFamily: "ArSf"),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.darkPrimaryColor
                                              .withOpacity(0.5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${snapshot.data!.surEnName}",
                                            style: AppColors.whiteStyle
                                                .copyWith(fontSize: 17),
                                          ),
                                          Text(
                                            "${snapshot.data!.surNumber}",
                                            style: AppColors.whiteStyle
                                                .copyWith(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "Translation of The Aya",
                              style: AppColors.whiteTitleStyle
                                  .copyWith(height: 1.7, fontSize: 22),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryColor,
                                ),
                                width: mSize.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextSelectionTheme(
                                        data: TextSelectionThemeData(
                                            // selectionColor:
                                            //     AppColors.darkPrimaryColor,
                                            ),
                                        child: SelectableText(
                                          snapshot.data!.enTran!,
                                          textAlign: TextAlign.justify,
                                          style: AppColors.whiteTitleStyle
                                              .copyWith(
                                            fontSize: 18,
                                            fontFamily: "Sf Med",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
