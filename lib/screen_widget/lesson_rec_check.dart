import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonRecCheck extends StatelessWidget {
  final String text;
  final Color color;
  const LessonRecCheck({
    Key? key, required this.text, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(80.r),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}