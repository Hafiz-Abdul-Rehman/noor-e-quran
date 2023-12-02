import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:noor_e_quran/Models/ayat_of_the_day_model.dart';
import 'package:http/http.dart' as http;
import 'package:noor_e_quran/Models/juz_model.dart';
import 'package:noor_e_quran/Models/qari_list_model.dart';
import 'package:noor_e_quran/Models/surah_model.dart';
import 'package:noor_e_quran/Models/translation_model.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/utils/utils.dart';

class ApiServices{

  final apiEndUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfTheDay() async{
    String url = "http://api.alquran.cloud/v1/ayah/${random(1, 6236)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    }else{
      print("Failed to Connect to Api!");
      return Utils.toastMessage("Failed to connect to Api!", AppColors.alertColor);
    }
  }
  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async{
    Response res = await http.get(Uri.parse(apiEndUrl));
    if (res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element){
        if(list.length < 114){
          list.add(Surah.fromJson(element));
        }
      }
      );
      print("ol ${list.length}");
      return list;
    }else{
      return Utils.toastMessage("Can't get Surah!", Colors.red);
    }
  }

  Future<JuzModel> getJuz(int index) async{
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return JuzModel.fromJSON(json.decode(response.body));
    }else{
      print("Failed to load!");
      return Utils.toastMessage("Failed to Load Juz/Parahs", Colors.red);
    }
  }

  Future<SurahTranslationList> getTranslation(int index, int translationIndex)async{

    String lang = '';
    if(translationIndex == 0){
      lang = "urdu_junagarhi";
    }else if(translationIndex == 1){
      lang = "english_saheeh";
    }else if(translationIndex == 2){
      lang = 'hindi_omari';
    }else if(translationIndex == 3){
      lang = "spanish_garcia";
    }
    final url = "https://quranenc.com/api/translation/sura/$lang/$index";
    var res = await http.get(Uri.parse(url));
    return SurahTranslationList.fromJSON(jsonDecode(res.body));
  }

  List<QariListModel> qariList = [];

  Future<List<QariListModel>> getQariList() async{
    const url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element){
      if(qariList.length < 157){
        qariList.add(QariListModel.fromjson(element));
      }
    });
    qariList.sort((a,b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}