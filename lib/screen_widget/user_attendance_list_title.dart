import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAttendanceListTitle extends StatelessWidget {
  final int flex;
  final String title;
  const UserAttendanceListTitle({
    Key? key, required this.title, required this.flex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 24.h,
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 12.sp, letterSpacing: -0.25.sp, fontWeight: FontWeight.bold, color: const Color(0xff343434),),),
      ),
    );
  }
}