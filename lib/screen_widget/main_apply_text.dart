import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApplyText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text1Count;
  final String text2Count;
  const MainApplyText({
    Key? key, required this.text1, required this.text1Count, required this.text2, required this.text2Count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 4.w,),
        Text(text1, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
        SizedBox(width: 5.w,),
        Text("${text1Count}건", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xff0099FF)),),
        SizedBox(width: 14.w,),
        Text(text2, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
        SizedBox(width: 5.w,),
        Text("${text2Count}건", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xff0099FF)),),
      ],
    );
  }
}
