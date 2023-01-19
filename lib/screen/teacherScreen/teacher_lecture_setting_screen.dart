import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consttants.dart';
import '../../screen_widget/appbar_black_close.dart';
import '../../screen_widget/attendance_box.dart';
import '../../screen_widget/lecture_detail_body.dart';
import '../../screen_widget/lecture_detail_sub_title.dart';
import '../../screen_widget/teacher_screen_widget/teacher_lecture_setting_list_items.dart';
import '../../screen_widget/uijeongbu_logo_appbar.dart';
import '../../screen_widget/user_attendance_list_items.dart';
import '../../screen_widget/user_attendance_list_title.dart';

class TeacherLectureSettingScreen extends StatelessWidget {
  const TeacherLectureSettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : TeacherLectureSettingScreen");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "강의 관리",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff020202),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          AppbarBlackClose(),
        ],
        leading: const UijeongbuLogoAppbar(
          blackLogo: true,
        ),
        leadingWidth: 70,
      ),
      body: SafeArea(
        child: Column(
          children: [
            LectureDetailSubTitle(
              textItem: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "강의목록",
                    style: TextStyle(
                      color: const Color(0xff343434),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "강의 관리",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff020202),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TeacherUserApplyBox(),
                      SizedBox(
                        height: 24.h,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherUserApplyBox extends StatelessWidget {
  const TeacherUserApplyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "강의 신청자 관리",
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
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xff0099FF), width: 2),
              ),
            ),
            child: Row(
              children: const [
                UserAttendanceListTitle(title: "", flex: 32),
                UserAttendanceListTitle(title: "신청인", flex: 48),
                UserAttendanceListTitle(title: "강의일시", flex: 80),
                UserAttendanceListTitle(title: "장소", flex: 112),
                UserAttendanceListTitle(title: "상태", flex: 48),
              ],
            ),
          ),

          //출석 날짜만큼 생성
          for (int i = 0; i < 4; i++) TeacherLectureSettingListItems(itemIndex: i),
        ],
      ),
    );
  }
}

