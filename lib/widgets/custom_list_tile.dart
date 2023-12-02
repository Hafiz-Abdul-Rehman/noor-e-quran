import 'package:flutter/material.dart';
import 'package:noor_e_quran/constants/colors.dart';

// class CustomListTile extends StatelessWidget {
//   String lang;
//   String num;
//   Widget radio;
//   CustomListTile({super.key, required this.lang, required this.num, required this.radio});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.25),
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: AppColors.darkGreyColor.withOpacity(0.4))
//         ),
//         height: 60,
//         width: double.infinity,
//         child: ListTile(
//           leading: Text("$num: ", style: AppColors.whiteStyle.copyWith(fontSize: 19, fontWeight: FontWeight.bold),),
//           title: Text(lang, style: AppColors.whiteStyle.copyWith(fontSize: 18),),
//           trailing: radio,
//         ),
//       ),
//     );
//   }
// }

Widget customListTile(BuildContext context, String lang, String num, Widget radio) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.darkGreyColor.withOpacity(0.4))
      ),
      height: 60,
      width: double.infinity,
      child: ListTile(
        leading: Text("$num: ", style: AppColors.whiteStyle.copyWith(fontSize: 19, fontWeight: FontWeight.bold),),
        title: Text(lang, style: AppColors.whiteStyle.copyWith(fontSize: 18),),
        trailing: radio,
      ),
    ),
  );
}
// class CustomListTile extends StatefulWidget {
//   const CustomListTile({Key? key}) : super(key: key);
//
//   @override
//   State<CustomListTile> createState() => _CustomListTileState();
// }
//
// class _CustomListTileState extends State<CustomListTile> {
//   @override
//   Widget build(BuildContext context) {
//     String lang;
//   String num;
//   Widget radio;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.25),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: AppColors.darkGreyColor.withOpacity(0.4))
//         ),
//         height: 60,
//         width: double.infinity,
//         child: ListTile(
//           leading: Text("$num: ", style: AppColors.whiteStyle.copyWith(fontSize: 19, fontWeight: FontWeight.bold),),
//           title: Text(lang, style: AppColors.whiteStyle.copyWith(fontSize: 18),),
//           trailing: radio,
//         ),
//       ),
//     );
//   }
// }
