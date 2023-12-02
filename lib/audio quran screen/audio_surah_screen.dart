import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/qari_list_model.dart';
import 'package:noor_e_quran/Models/surah_model.dart';
import 'package:noor_e_quran/audio%20quran%20screen/audio_screen.dart';
import 'package:noor_e_quran/constants/colors.dart';

class AudioSurahScreen extends StatefulWidget {
  AudioSurahScreen({Key? key, required this.qari, required this.itQari}) : super(key: key);
  final QariListModel qari;
  final String itQari;

  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
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
        title: Text(widget.itQari.toString(), style: AppColors.appBarWhiteStyle.copyWith(fontSize: 20),),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot){
            if(snapshot.hasData){
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return AudioTile(
                      surahName: snapshot.data![index].englishName!,
                      totalAya: snapshot.data![index].numberOfAyahs,
                      number: snapshot.data![index].number,
                      onTap: (){
                        // QariListModel _qari;
                        // List<Surah>? surah;
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return AudioScreen(
                            qari: widget.qari,
                            index: index + 1,
                            list: surah,
                        );}));
                      },
                  );
                },
              );
            }else{
              return const Center(
                child: SpinKitThreeBounce(
                  size: 30,
                  color: AppColors.whiteColor,
                ),
              );
            }
          },
        ),
      ),
    );

  }
}

Widget AudioTile({required String surahName, required totalAya, required number, required VoidCallback onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Padding(
        padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              opacity: 0.025,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_para.png")),
          color: Colors.black.withOpacity(0.25),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor
              ),
              child: Text(
                number.toString(), style: AppColors.whiteStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(surahName, textAlign: TextAlign.end, style: AppColors.whiteStyle.copyWith(fontSize: 19, fontFamily: "Sf Bold"),),
                const SizedBox(height: 4,),
                Text("Total Ayahs: $totalAya", textAlign: TextAlign.end, style: AppColors.whiteStyle.copyWith(fontSize: 17),)
              ],
            ),
            const Spacer(),
            const Icon(FontAwesomeIcons.play, color: AppColors.whiteColor,),
          ],
        ),
      ),
    ),
  );
}