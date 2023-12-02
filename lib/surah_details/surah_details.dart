import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/translation_model.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/constants/constants.dart';
import 'package:noor_e_quran/widgets/custom_list_tile.dart';
import 'package:noor_e_quran/widgets/translation_tile.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

enum Translation { urdu, english, hindi, spanish }

class SurahDetails extends StatefulWidget {
  static String id = "surah_details";
  SurahDetails({Key? key}) : super(key: key);
  String fontName = "";

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  ApiServices apiServices = ApiServices();
  final SolidController _solidController = SolidController();
  Translation? _translation = Translation.urdu;

  String fontName = "";
  @override
  Widget build(BuildContext context) {
    // Translation? _translation = Translation.urdu;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Row(
            children: [
              const SizedBox(
                width: 7,
              ),
              IconButton(
                tooltip: "Back",
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showLanguageSheet();
              },
              tooltip: "Change Language",
              icon: Image.asset(
                "assets/svgs/language3.png",
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
          title: Text('Noor e Quran',
              style: AppColors.whiteStyle.copyWith(fontSize: 20)),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: apiServices.getTranslation(Constants.surahIndex!, _translation!.index),
            builder: (BuildContext context,
                AsyncSnapshot<SurahTranslationList> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SpinKitThreeBounce(
                  color: AppColors.whiteColor,
                  size: 30,
                );
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(bottom: 50),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.translationList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Mapppp(
                                  index: index,
                                  surahTranslation:
                                      snapshot.data!.translationList[index],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    "Data Not Found!",
                    style: AppColors.whiteStyle,
                  ),
                );
              }
            },
          ),
        ),
        bottomSheet: showLanguageSheet(),
        // bottomSheet: SolidBottomSheet(
        //   controller: _solidController,
        //   draggableBody: true,
        //   canUserSwipe: true,
        //   minHeight: 0,
        //   maxHeight: MediaQuery.of(context).size.height * 0.6,
        //   headerBar: Container(
        //     color: AppColors.darkPrimaryColor,
        //     height: 50,
        //     child: Center(
        //       child: Text(
        //         "Change Language!",
        //         style: AppColors.whiteStyle.copyWith(fontSize: 19),
        //       ),
        //     ),
        //   ),
        //   body: SingleChildScrollView(
        //     child: Container(
        //       height: MediaQuery.of(context).size.height * 0.6,
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(0),
        //         color: AppColors.mDarkBackgroundColor,
        //       ),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(
        //               left: 150.0,
        //               right: 150.0,
        //               bottom: 20,
        //               top: 3,
        //             ),
        //
        //             child: Container(
        //               height: 4,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: AppColors.whiteColor,
        //               ),
        //             ),
        //             // child: Divider(
        //             //   thickness: 4.0,
        //             //   color: AppColors.whiteColor,
        //             // ),
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           Container(
        //             height: 110,
        //             width: 110,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(20),
        //                 border: Border.all(
        //                     color: AppColors.whiteColor.withOpacity(0.2))),
        //             child: Image(
        //               image: AssetImage('assets/svgs/language3.png'),
        //               height: 100,
        //               width: 100,
        //             ),
        //           ),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   "Select your Language:",
        //                   style: AppColors.whiteStyle.copyWith(
        //                       fontSize: 19, fontWeight: FontWeight.bold),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 10.0),
        //             child: Container(
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 9.0),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom: 8.0),
        //                       child: Container(
        //                         padding: EdgeInsets.symmetric(horizontal: 10),
        //                         decoration: BoxDecoration(
        //                             color: Colors.black.withOpacity(0.25),
        //                             borderRadius: BorderRadius.circular(15),
        //                             border: Border.all(
        //                                 color: AppColors.darkGreyColor
        //                                     .withOpacity(0.4))),
        //                         height: 60,
        //                         width: double.infinity,
        //                         child: ListTile(
        //                           leading: Text(
        //                             "1: ",
        //                             style: AppColors.whiteStyle.copyWith(
        //                                 fontSize: 19,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           title: Text(
        //                             "Urdu",
        //                             style: AppColors.whiteStyle
        //                                 .copyWith(fontSize: 18),
        //                           ),
        //                           trailing: Radio<Translation>(
        //                             value: Translation.urdu,
        //                             groupValue: _translation,
        //                             onChanged: (Translation? value) {
        //                               setState(() {
        //                                 _translation = value;
        //                                 print(value);
        //                               });
        //                             },
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom: 8.0),
        //                       child: Container(
        //                         padding: EdgeInsets.symmetric(horizontal: 10),
        //                         decoration: BoxDecoration(
        //                             color: Colors.black.withOpacity(0.25),
        //                             borderRadius: BorderRadius.circular(15),
        //                             border: Border.all(
        //                                 color: AppColors.darkGreyColor
        //                                     .withOpacity(0.4))),
        //                         height: 60,
        //                         width: double.infinity,
        //                         child: ListTile(
        //                           leading: Text(
        //                             "2: ",
        //                             style: AppColors.whiteStyle.copyWith(
        //                                 fontSize: 19,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           title: Text(
        //                             "English",
        //                             style: AppColors.whiteStyle
        //                                 .copyWith(fontSize: 18),
        //                           ),
        //                           trailing: Radio<Translation>(
        //                             value: Translation.english,
        //                             groupValue: _translation,
        //                             onChanged: (Translation? value) {
        //                               setState(() {
        //                                 _translation = value;
        //                                 print(value);
        //                               });
        //                             },
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom: 8.0),
        //                       child: Container(
        //                         padding: EdgeInsets.symmetric(horizontal: 10),
        //                         decoration: BoxDecoration(
        //                             color: Colors.black.withOpacity(0.25),
        //                             borderRadius: BorderRadius.circular(15),
        //                             border: Border.all(
        //                                 color: AppColors.darkGreyColor
        //                                     .withOpacity(0.4))),
        //                         height: 60,
        //                         width: double.infinity,
        //                         child: ListTile(
        //                           leading: Text(
        //                             "3: ",
        //                             style: AppColors.whiteStyle.copyWith(
        //                                 fontSize: 19,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           title: Text(
        //                             "Hindi",
        //                             style: AppColors.whiteStyle
        //                                 .copyWith(fontSize: 18),
        //                           ),
        //                           trailing: Radio<Translation>(
        //                             value: Translation.hindi,
        //                             groupValue: _translation,
        //
        //                             onChanged: (Translation? value) {
        //                               setState(() {
        //                                 _translation = value;
        //                                 print(value);
        //                               });
        //                             },
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom: 8.0),
        //                       child: Container(
        //                         padding: EdgeInsets.symmetric(horizontal: 10),
        //                         decoration: BoxDecoration(
        //                             color: Colors.black.withOpacity(0.25),
        //                             borderRadius: BorderRadius.circular(15),
        //                             border: Border.all(
        //                                 color: AppColors.darkGreyColor
        //                                     .withOpacity(0.4))),
        //                         height: 60,
        //                         width: double.infinity,
        //                         child: ListTile(
        //                           leading: Text(
        //                             "4: ",
        //                             style: AppColors.whiteStyle.copyWith(
        //                                 fontSize: 19,
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                           title: Text(
        //                             "Spanish",
        //                             style: AppColors.whiteStyle
        //                                 .copyWith(fontSize: 18),
        //                           ),
        //                           trailing: Radio<Translation>(
        //                               value: Translation.spanish,
        //                               groupValue: _translation,
        //                               onChanged: (Translation? value) {
        //                                 setState(() {
        //                                   _translation = value;
        //                                 });
        //                               },
        //                             ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
    );
  }

  showLanguageSheet(){
    return SolidBottomSheet(
      controller: _solidController,
      draggableBody: true,
      canUserSwipe: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.6,
      headerBar: Container(
        color: AppColors.dialogAlertBackgroundColor,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Swipe-up for more Languages!",
                style: AppColors.whiteStyle.copyWith(fontSize: 19),
              ),
            ),
            const SizedBox(width: 10,),
            const Icon(Icons.swipe_up_alt_sharp, size: 23, color: AppColors.whiteColor,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: AppColors.mDarkBackgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 150.0,
                  right: 150.0,
                  bottom: 20,
                  top: 3,
                ),

                child: Container(
                  height: 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor,
                  ),
                ),
                // child: Divider(
                //   thickness: 4.0,
                //   color: AppColors.whiteColor,
                // ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppColors.whiteColor.withOpacity(0.2))),
                child: const Image(
                  image: AssetImage('assets/svgs/language3.png'),
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Select your Language:",
                      style: AppColors.whiteStyle.copyWith(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.darkGreyColor
                                        .withOpacity(0.4))),
                            height: 60,
                            width: double.infinity,
                            child: ListTile(
                              leading: Text(
                                "1: ",
                                style: AppColors.whiteStyle.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "Urdu",
                                style: AppColors.whiteStyle
                                    .copyWith(fontSize: 18),
                              ),
                              trailing: Radio<Translation>(
                                value: Translation.urdu,
                                groupValue: _translation,
                                fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                onChanged: (Translation? value) {
                                  fontName = "ArSf";
                                  setState(() {
                                    _translation = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.darkGreyColor
                                        .withOpacity(0.4))),
                            height: 60,
                            width: double.infinity,
                            child: ListTile(
                              leading: Text(
                                "2: ",
                                style: AppColors.whiteStyle.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "English",
                                style: AppColors.whiteStyle
                                    .copyWith(fontSize: 18),
                              ),
                              trailing: Radio<Translation>(
                                value: Translation.english,
                                groupValue: _translation,
                                fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                onChanged: (Translation? value) {
                                  fontName = "Sf Med";
                                  setState(() {
                                    _translation = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.darkGreyColor
                                        .withOpacity(0.4))),
                            height: 60,
                            width: double.infinity,
                            child: ListTile(
                              leading: Text(
                                "3: ",
                                style: AppColors.whiteStyle.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "Hindi",
                                style: AppColors.whiteStyle
                                    .copyWith(fontSize: 18),
                              ),
                              trailing: Radio<Translation>(
                                value: Translation.hindi,
                                groupValue: _translation,
                                fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                onChanged: (Translation? value) {
                                  fontName = "Sf Med";
                                  setState(() {
                                    _translation = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: AppColors.darkGreyColor
                                        .withOpacity(0.4))),
                            height: 60,
                            width: double.infinity,
                            child: ListTile(
                              leading: Text(
                                "4: ",
                                style: AppColors.whiteStyle.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "Spanish",
                                style: AppColors.whiteStyle
                                    .copyWith(fontSize: 18),
                              ),
                              trailing: Radio<Translation>(
                                value: Translation.spanish,
                                groupValue: _translation,
                                fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                onChanged: (Translation? value) {
                                  fontName = "Sf Med";
                                  setState(() {
                                    _translation = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showLangSheet() {
    return showModalBottomSheet(
        backgroundColor: AppColors.transparent,
        context: context,
        builder: (context) {
          Translation? translation = Translation.urdu;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.mDarkBackgroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 150.0,
                      right: 150.0,
                      bottom: 20,
                      top: 3,
                    ),

                    child: Container(
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor,
                      ),
                    ),
                    // child: Divider(
                    //   thickness: 4.0,
                    //   color: AppColors.whiteColor,
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.whiteColor.withOpacity(0.2))),
                    child: const Image(
                      image: AssetImage('assets/svgs/language3.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select your Language:",
                          style: AppColors.whiteStyle.copyWith(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ListTile(
                              leading: Text(
                                "1: ",
                                style: AppColors.whiteStyle.copyWith(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "Urdu",
                                style:
                                    AppColors.whiteStyle.copyWith(fontSize: 18),
                              ),
                              trailing: Radio<Translation>(
                                value: Translation.urdu,
                                activeColor: AppColors.greyTextColor,
                                groupValue: translation,
                                onChanged: (Translation? value) {
                                  setState(() {
                                    translation = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),
                            customListTile(
                              context,
                              "Language",
                              "2",
                              Radio<Translation>(
                                value: Translation.english,
                                groupValue: translation,
                                onChanged: (Translation? value) {
                                  setState(() {
                                    translation = value;
                                  });
                                  print(value);
                                },
                              ),
                            ),
                            customListTile(
                              context,
                              "Language",
                              "3",
                              Radio<Translation>(
                                value: Translation.hindi,
                                groupValue: translation,
                                onChanged: (Translation? value) {
                                  setState(() {
                                    translation = value;
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
