import 'package:flutter/material.dart';
import 'package:noor_e_quran/Models/surah_model.dart';
import 'package:noor_e_quran/constants/colors.dart';

Widget SurahCustomListTile({
  required Surah surah,
  required BuildContext context,
  required VoidCallback onTap,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 40,
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkPrimaryColor
                  ),
                  child: Center(child: Text(surah.number.toString()!, style: AppColors.whiteStyle.copyWith(fontSize: 14),)),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(surah.englishName!, style: AppColors.whiteStyle.copyWith(fontSize: 20),),
                    Text(surah.englishNameTranslation!, style: AppColors.whiteStyle.copyWith(fontSize: 15),),
                  ]
                ),
                Spacer(),
                Text(surah.name!, style: AppColors.whiteStyle.copyWith(fontFamily: "ArSf", fontSize: 20),),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
