import 'package:flutter/material.dart';
import 'package:noor_e_quran/Models/qari_list_model.dart';
import 'package:noor_e_quran/constants/colors.dart';

class QariCustomTile extends StatelessWidget {
  final QariListModel? qari;
  final VoidCallback onTap;
  QariCustomTile({Key? key, required this.qari, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(qari!.name!, style: AppColors.whiteStyle.copyWith(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
