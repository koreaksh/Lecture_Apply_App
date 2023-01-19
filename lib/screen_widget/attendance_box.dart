import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/user_attendance_list_items.dart';
import 'package:shinhanapp/screen_widget/user_attendance_list_title.dart';
import 'package:shinhanapp/screen_widget/user_attendance_tag.dart';

import '../consttants.dart';
import '../provider/user_attendance_provider.dart';

class AttendanceBox extends StatelessWidget {
  const AttendanceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAttendanceProvider userAttendanceProvider = context.read();

    if (kDebugMode) {
      print("빌드 : AttendanceBox");
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "출결현황",
            style: TextStyle(
              letterSpacing: -0.25.sp,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: black02,
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Row(
            children: [
              UserAttendanceTag(
                title: "출석",
                value: userAttendanceProvider.attendanceCount.toString(),
                type: "번",
                titleBackColor: const Color(0xff0099FF),
              ),
              SizedBox(
                width: 4.w,
              ),
              UserAttendanceTag(
                title: "결석",
                value: userAttendanceProvider.absentCount.toString(),
                type: "번",
                titleBackColor: const Color(0xffFF5078),
              ),
              SizedBox(
                width: 4.w,
              ),
              UserAttendanceTag(
                title: "성적",
                value: userAttendanceProvider.attendancePercent.toString(),
                type: "%",
                titleBackColor: const Color(0xff343434),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xff0099FF), width: 2),
              ),
            ),
            child: Row(
              children: const [
                UserAttendanceListTitle(title: "횟수", flex: 40),
                UserAttendanceListTitle(title: "강의일시", flex: 80),
                UserAttendanceListTitle(title: "장소", flex: 112),
                UserAttendanceListTitle(title: "출석여부", flex: 88),
              ],
            ),
          ),

          //출석 날짜만큼 생성
          for (int i = 0; i < userAttendanceProvider.attendanceAllCount; i++) UserAttendanceListItems(itemIndex: i),
        ],
      ),
    );
  }
}