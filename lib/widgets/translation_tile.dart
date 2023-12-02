import 'package:flutter/material.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/translation_model.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/surah_details/surah_details.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;
  ApiServices apiServices = ApiServices();
  TranslationTile({super.key, required this.index, required this.surahTranslation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.025,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_para.png")),
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(4),
              width: double.infinity,
              child: Center(child: Container(
                padding: EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkPrimaryColor,
                ),
                child: Text(surahTranslation.aya!, style: AppColors.whiteStyle.copyWith(
                  /*fontFamily: "ArSf",*/ fontSize: 17,
                ),),
              )),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(14),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectableText(surahTranslation.arabic_text!,
                    textAlign: TextAlign.center,
                    style: AppColors.whiteStyle.copyWith(
                    fontFamily: "ArSf", fontSize: 22,
                  ),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.3, vertical: 5),
                    child: Divider(color: AppColors.whiteColor, thickness: 2),
                  ),
                  // Text("Translation: ", textAlign: TextAlign.center,style: AppColors.whiteStyle.copyWith(
                  //   fontFamily: "Sf Bold", fontSize: 21, fontWeight: FontWeight.bold, height: 1.3
                  // ),),
                  SelectableText(surahTranslation.translation!,
                    textAlign: TextAlign.center,
                    style: AppColors.whiteStyle.copyWith(
                      fontFamily: "Sf Med", fontSize: 19,
                    ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Mapppp extends StatelessWidget {
  int index;
  final SurahTranslation surahTranslation;
  ApiServices apiServices = ApiServices();
  SurahDetails surahDetails = SurahDetails();
  Mapppp({Key? key, required this.index, required this.surahTranslation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.025,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_para.png")),
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.dialogAlertBackgroundColor,
                  ),
                  child: Text(surahTranslation.aya!, style: AppColors.whiteStyle.copyWith(
                    /*fontFamily: "ArSf",*/ fontSize: 14,
                  ),),
                ),
              ),
            ),
            SelectableText(surahTranslation.arabic_text!,
              textAlign: TextAlign.center,
              style: AppColors.whiteStyle.copyWith(
                fontFamily: "ArSf", fontSize: 22,
              ),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.1, vertical: 5),
              child: Text("Translation: ", style: AppColors.whiteStyle.copyWith(fontSize: 20),)
            ),
            // Text("Translation: ", textAlign: TextAlign.center,style: AppColors.whiteStyle.copyWith(
            //   fontFamily: "Sf Bold", fontSize: 21, fontWeight: FontWeight.bold, height: 1.3
            // ),),
            SelectableText(surahTranslation.translation.toString(),
              textAlign: TextAlign.center,
              style: AppColors.whiteStyle.copyWith(
                fontFamily: "",
                fontSize: 18,
              ),),
          ],
        ),
      ),
    );
  }
}
