import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({Key? key}) : super(key: key);

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Location location = Location();
  LocationData? _currentPosition;
  double? latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Get.offNamed("/main");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.whiteColor,
          ),
        ),
        title: const Text(
          "Prayer Timings",
          style: AppColors.appBarWhiteStyle,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitThreeBounce(
                  size: 30,
                  color: AppColors.whiteColor,
                ),
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 30),
                      padding: const EdgeInsets.all(0),
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withOpacity(0.5)),
                        image: const DecorationImage(
                                    // height: 400,
                                    image: AssetImage(
                                  "assets/images/Noor_Logo.png",
                                  ),
                                  // fit: BoxFit.none,
                                  opacity: 0.2
                                  ),
                        borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor,),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 30),
                                alignment: Alignment.centerLeft,
                                height: MediaQuery.sizeOf(context).height * 0.15,
                                // width: MediaQuery.sizeOf(context).width * 0.4,
                                color: Colors.transparent,
                                child: Text("Prayer Times", style: AppColors.titleStyle.copyWith(color: Colors.white),),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 30),
                                alignment: Alignment.centerRight,
                                height: MediaQuery.sizeOf(context).height * 0.15,
                                // width: MediaQuery.sizeOf(context).width * 0.45,
                                color: Colors.transparent,
                                child:  const Icon(FlutterIslamicIcons.solidMosque, size: 50, color: Colors.white,),
                              ),
                            ],
                          ),
                    ),
                    prTimeListTile(context, "Fajar", "4:38 AM"),
                    prTimeListTile(context, "Sunrise", "6:16 AM"),
                    prTimeListTile(context, "Dhuhr", "1:07 PM"),
                    prTimeListTile(context, "Asr", "5:57 PM"),
                    prTimeListTile(context, "Maghrib", "7:56 PM"),
                    prTimeListTile(context, "Isha", "9:34 PM"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Region/Location",
                            style: AppColors.appBarWhiteStyle
                                .copyWith(fontSize: 20),
                          ),
                          Text(
                            "Karachi, Pakistan",
                            style: AppColors.whiteStyle.copyWith(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;
    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;
  }
}

Widget prTimeListTile(BuildContext context, String nmaz, String time) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.whiteColor.withOpacity(0.13)),
          borderRadius: BorderRadius.circular(12)),
      color: Colors.black.withOpacity(0.02),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nmaz,
                style: AppColors.appBarWhiteStyle.copyWith(fontSize: 20),
              ),
              Text(
                time,
                style: AppColors.whiteStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
