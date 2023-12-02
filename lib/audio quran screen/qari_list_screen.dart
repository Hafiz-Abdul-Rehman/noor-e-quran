import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/qari_list_model.dart';
import 'package:noor_e_quran/audio%20quran%20screen/audio_surah_screen.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/home%20screen/home_screen.dart';
import 'package:noor_e_quran/home%20screen/main_screen.dart';
import 'package:noor_e_quran/widgets/qari_custom_tile.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({Key? key}) : super(key: key);

  @override
  State<QariListScreen> createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {

  final searchController = TextEditingController();
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            IconButton(
              tooltip: "Back",
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
          ],
        ),
        title: Text("Listen Quran"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 12,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: AppColors.mDarkBackgroundColor
              ),
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                controller: searchController,
                cursorColor: AppColors.whiteColor,
                style: AppColors.whiteStyle.copyWith(fontSize: 19),
                decoration: InputDecoration(
                  hintStyle: AppColors.whiteStyle.copyWith(fontSize: 19, color: Colors.white.withOpacity(0.4)),
                  hintText: "Search",
                  fillColor: Colors.black.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.whiteColor.withOpacity(0.2), width: 0.7,),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.whiteColor.withOpacity(0.2), width: 2,),
                    ),
                  contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10).copyWith(left: 20),
                  suffixIcon: IconButton(
                    splashRadius: 20,
                    onPressed: () => setState(() {
                      searchController.text = '';
                    }),
                      icon: Icon(
                        searchController.text.isEmpty ? CupertinoIcons.search:
                        CupertinoIcons.clear_circled,
                        color: AppColors.whiteColor.withOpacity(0.4),)),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: FutureBuilder(
              future: apiServices.getQariList(),
              builder: (BuildContext context, AsyncSnapshot<List<QariListModel>> snapshot){
                if(snapshot.hasError){
                  return const Center(child: Text(
                    "Data Not Found!",
                    style: AppColors.whiteStyle,
                  ),
                  );
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: SpinKitThreeBounce(
                      size: 30,
                      color: AppColors.whiteColor,
                    ),
                  );
                }else{
                  return Column(
                    children: [
                      // Text("Available Qari's: ${snapshot.data!.length.toString()}",
                      //   style: AppColors.whiteStyle.copyWith(
                      //       color: Colors.white.withOpacity(0.7),fontSize: 18),),
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            if(searchController.text == null){
                              return QariCustomTile(
                                  qari: snapshot.data![index],
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return AudioSurahScreen(
                                        itQari: snapshot.data![index].name.toString(),
                                        qari: snapshot.data![index],
                                      );
                                    }));
                                  }
                              );
                            }
                            else if(snapshot.data![index].name!.toLowerCase().contains(searchController.text.toLowerCase())){

                              return QariCustomTile(
                                  qari: snapshot.data![index],
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return AudioSurahScreen(
                                        itQari: snapshot.data![index].name.toString(),
                                        qari: snapshot.data![index],
                                      );
                                    }));

                                  }
                              );
                            }else{
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
