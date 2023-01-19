
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainCurrentText extends StatelessWidget {
  final String text;
  final String count;
  final Color color;
  const MainCurrentText({
    Key? key, required this.text, required this.count, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 4.w,),
        Text(text, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),),
        SizedBox(width: 5.w,),
        Text("${count}건", style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold, color: color),),
      ],
    );
  }
}