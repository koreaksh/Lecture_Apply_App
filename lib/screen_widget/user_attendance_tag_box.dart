import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAttendanceTagBox extends StatelessWidget {
  final String text;
  final Color color;
  const UserAttendanceTagBox({
    Key? key, required this.text, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.r),
          bottomLeft: Radius.circular(4.r),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
            color: Colors.white,
            letterSpacing: -0.25.sp,
          ),
        ),
      ),
    );
  }
}