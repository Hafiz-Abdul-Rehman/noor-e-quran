import 'package:flutter/material.dart';
import 'package:noor_e_quran/Juz%20Screen/juz_screen.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/Models/surah_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/constants/constants.dart';
import 'package:noor_e_quran/surah_details/surah_details.dart';
import 'package:noor_e_quran/widgets/surah_custom_list.dart';
class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Quran Shareef", style: AppColors.appBarWhiteStyle,),
          bottom: TabBar(

            physics: const PageScrollPhysics(),
            labelPadding: const EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Text("Surah", style: AppColors.whiteStyle.copyWith(fontSize: 18),),
              Text("Parah", style: AppColors.whiteStyle.copyWith(fontSize: 18),),
            ],
          ),
        ),
      body: TabBarView(
        // physics: PageScrollPhysics(),
        children: <Widget>[
          FutureBuilder(
            future: _apiServices.getSurah(),
              builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot){
              if (snapshot.hasData){
                List<Surah>? surah = snapshot.data;
                return ListView.builder(
                  itemCount: surah!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return SurahCustomListTile(
                      surah: surah[index],
                      context: context,
                      onTap: (){
                        setState(() {
                          Constants.surahIndex =  (index + 1);
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SurahDetails()));
                      }
                    );
                  },
                );
              }else{
                return const Center(
                  child: SpinKitThreeBounce(
                    color: AppColors.whiteColor,
                    size: 30,
                  ),
                );
              }
              // return const Column();
          }),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: 30,
                physics: const BouncingScrollPhysics(),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        Constants.juzIndex = (index + 1);
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => JuzScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                              opacity: 0.025,
                              image: AssetImage("assets/images/bg_para.png")
                          ),
                        color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("${index + 1} ", style: AppColors.whiteStyle,),
                        ),
                      ),
                    ),
                  );
                  }
              ),
            ),
          )
        ],
      )
    ),
    );
  }
}
