import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noor_e_quran/Models/api_services.dart';
import 'package:noor_e_quran/Models/juz_model.dart';
import 'package:noor_e_quran/constants/colors.dart';
import 'package:noor_e_quran/constants/constants.dart';
import 'package:noor_e_quran/utils/utils.dart';
import 'package:noor_e_quran/widgets/juz_custom_tile.dart';

class JuzScreen extends StatelessWidget {
  static const String id = 'juz_screen';
  ApiServices apiServices = ApiServices();

    var list = '';
    int inndex = 0;

  JuzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Quran Juz"),
      //   automaticallyImplyLeading: false,
      // ),
      body: SafeArea(
        child: FutureBuilder<JuzModel>(
          future: apiServices.getJuz(Constants.juzIndex!),
            builder: (context, AsyncSnapshot<JuzModel> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: SpinKitThreeBounce(
                color: AppColors.whiteColor,
                size: 40,
              ),);
            }else if(snapshot.hasData){
              print('${snapshot.data!.juzAyahs.length} juz length');
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Juz No. ${snapshot.data!.juzNumber.toString()}',
                            style: AppColors.whiteStyle.copyWith(fontSize: 20)),
                        Text('No. of Ayahs: ${snapshot.data!.juzAyahs.length.toString()}',
                            style: AppColors.whiteStyle.copyWith(fontSize: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.juzAyahs.length,
                      itemBuilder: (context, index){
                        return JuzCustomTile(
                          list: snapshot.data!.juzAyahs,
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              );
            }else{
              Utils.toastMessage("No Data Found!", Colors.red);
              return Center(child: Text("No Data Found!"),);
            }
            },
        ),
      ),
    );
  }
}
