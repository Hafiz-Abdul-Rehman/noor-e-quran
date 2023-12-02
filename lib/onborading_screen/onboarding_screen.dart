import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';
import 'package:noor_e_quran/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                imageFlex: 2,
                bodyFlex: 1,
                imagePadding: EdgeInsets.only(top: 50),
                titlePadding:  EdgeInsets.only(top: 20,bottom: 8),
              ),
              // title: "Title of First",
              titleWidget: Text("Read Quran Pak", style: AppColors.whiteTitleStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.w600,
              ),),
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        "Read Quran Pak in multiple Languages, listen Different Audios, Customize your Reading View.",
                      textAlign: TextAlign.center, style: AppColors.greyStyle.copyWith(fontSize: 20,height: 1.3),
                    ),
                  ),
                  // SizedBox(height: 40,),
                  // Image(
                  //   height: 200,
                  //     width: 200,
                  //     image: AssetImage("assets/images/noor-logo.png",)
                  // ),
                ],
              ),
              image: Center(child: Image.asset("assets/images/quran1.png"))
            ),
            PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 2,
                  bodyFlex: 1,
                  imagePadding: EdgeInsets.only(top: 50),
                  titlePadding:  EdgeInsets.only(top: 20,bottom: 8),
                ),
                // title: "Title of First",
                titleWidget: Text("Prayer on Time", style: AppColors.whiteTitleStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.w600,
                ),),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Choose your Country and Adhan time, customize which prayer to be Notified and when.",
                        textAlign: TextAlign.center, style: AppColors.greyStyle.copyWith(fontSize: 20,height: 1.3),
                      ),
                    ),
                    // SizedBox(height: 40,),
                    // Image(
                    //   height: 200,
                    //     width: 200,
                    //     image: AssetImage("assets/images/noor-logo.png",)
                    // ),
                  ],
                ),
                image: Center(child: Image.asset("assets/images/namaz.png"))
            ),
            PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 2,
                  bodyFlex: 1,
                  imagePadding: EdgeInsets.only(top: 50),
                  titlePadding:  EdgeInsets.only(top: 20,bottom: 8),
                ),
                // title: "Title of First",
                titleWidget: Text("Adapt Good Habits", style: AppColors.whiteTitleStyle.copyWith(
                  fontSize: 22, fontWeight: FontWeight.w600,
                ),),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Learn a Good Habit and Dua Every day and Earn Sawaab.",
                        textAlign: TextAlign.center, style: AppColors.greyStyle.copyWith(fontSize: 20,height: 1.3),
                      ),
                    ),
                    // SizedBox(height: 40,),
                    // Image(
                    //   height: 200,
                    //     width: 200,
                    //     image: AssetImage("assets/images/noor-logo.png",)
                    // ),
                  ],
                ),
                image: Center(child: Image.asset("assets/images/give-zakat.png"))
            ),
          ],
          onDone: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
          onSkip: (){},
          showSkipButton: true,
          showNextButton: true,
          skip: Icon(Icons.skip_next_rounded, color: AppColors.whiteColor,),
          next: Icon(CupertinoIcons.forward, color: AppColors.whiteColor),
          done: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Done ", style: AppColors.whiteStyle.copyWith(fontSize: 20, ),),
              Icon(Icons.check_circle, size: 25,color: AppColors.primaryColor,),
            ],
          ),
          isBottomSafeArea: true,
          scrollPhysics: BouncingScrollPhysics(),
          dotsDecorator: DotsDecorator(
            size: Size.square(10),
            activeSize: Size(20, 10),
            activeColor: AppColors.primaryColor,
            color: AppColors.whiteColor.withOpacity(0.8),
            spacing: EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),


          ),
        ),
      ),
    );
  }
}
