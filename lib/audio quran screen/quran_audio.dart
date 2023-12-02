import 'package:flutter/material.dart';
import 'package:noor_e_quran/constants/colors.dart';

class QuranAudioScreen extends StatefulWidget {
  const QuranAudioScreen({Key? key}) : super(key: key);

  @override
  State<QuranAudioScreen> createState() => _QuranAudioScreenState();
}

class _QuranAudioScreenState extends State<QuranAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Audio Quran Screen", style: AppColors.whiteTitleStyle,),
        ),
      ),
    );
  }
}
