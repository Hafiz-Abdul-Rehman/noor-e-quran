import 'package:flutter/material.dart';
import 'package:noor_e_quran/Models/juz_model.dart';
import 'package:noor_e_quran/constants/colors.dart';

class JuzCustomTile extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;

  JuzCustomTile({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.025,
            fit: BoxFit.cover,
              image: AssetImage("assets/images/bg_para.png"),
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(list[index].ayahNumber.toString(), style: AppColors.whiteStyle.copyWith(fontSize: 14)),
            SelectableText("${list[index].ayahsText.toString()}",
              style: AppColors.whiteStyle.copyWith(fontSize: 22, fontFamily: "ArSf"), textAlign: TextAlign.end,),
            SelectableText(list[index].surahName.toString(),
              style: AppColors.whiteStyle.copyWith(fontSize: 14, fontFamily: "ArSf"), textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}

class CAppBar extends StatelessWidget {
  List<JuzAyahs> list;
  int index;
  CAppBar({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(list[index].surahName.toString(), style: AppColors.whiteStyle.copyWith(fontSize: 14),),
    );
  }
}

