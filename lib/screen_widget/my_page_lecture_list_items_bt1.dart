import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinhanapp/screen/user_attendance_screen.dart';

class MyPageLectureListItemsBt1 extends StatelessWidget {
  final int index;
  const MyPageLectureListItemsBt1({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserAttendanceScreen(listIndex: index)));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          136.w,
          32.h,
        ),
        backgroundColor: const Color(0xff0099FF),
      ),
      child: Text(
        "상세보기",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}