import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/lecture_info_provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';
import 'package:shinhanapp/provider/user_attendance_provider.dart';
import 'package:shinhanapp/screen_widget/lecture_detail_body.dart';

import '../consttants.dart';
import '../screen_widget/appbar_black_close.dart';
import '../screen_widget/attendance_box.dart';
import '../screen_widget/lecture_detail_sub_title.dart';
import '../screen_widget/uijeongbu_logo_appbar.dart';
import '../screen_widget/user_attendance_list_items.dart';
import '../screen_widget/user_attendance_list_title.dart';
import '../screen_widget/user_attendance_tag.dart';
import '../screen_widget/user_attendance_tag_box.dart';
import '../screen_widget/user_attendance_tag_value.dart';

class UserAttendanceScreen extends StatefulWidget {
  final int listIndex;

  const UserAttendanceScreen({Key? key, required this.listIndex})
      : super(key: key);

  @override
  State<UserAttendanceScreen> createState() => _UserAttendanceScreenState();
}

class _UserAttendanceScreenState extends State<UserAttendanceScreen> {
  late UserAttendanceProvider _userAttendanceProvider;
  late LoginProvider _loginProvider;
  late MyPageProvider _myPageProvider;
  late LectureInfoProvider _lectureInfoProvider;

  @override
  void initState() {
    super.initState();
    _userAttendanceProvider = context.read();
    _loginProvider = context.read();
    _myPageProvider = context.read();
    _lectureInfoProvider = context.read();
    _userAttendanceProvider.loadUserAttendance(
      _loginProvider.loginModel!.getUserIndex(),
      _myPageProvider.getModelList()![widget.listIndex].getLectureIndex(),
      _myPageProvider.getModelList()![widget.listIndex].getDetailIndex(),
    );
    _lectureInfoProvider.loadLectureInfo(int.parse(
        _myPageProvider.getModelList()![widget.listIndex].getLectureIndex()));
  }

  @override
  void dispose() {
    super.dispose();
    _userAttendanceProvider.clear();
    _lectureInfoProvider.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : UserAttendanceScreen");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "나의 강의현황",
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
                    "나의 강의현황",
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
                    "강의 상세내역",
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
            Consumer<UserAttendanceProvider>(
              builder: (context, provider, widget) {
                if (provider.check) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AttendanceBox(),
                            SizedBox(
                              height: 24.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "강의정보",
                                style: TextStyle(
                                  letterSpacing: -0.25.sp,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: black02,
                                ),
                              ),
                            ),
                            SizedBox(height: 21.h,),
                            LectureDetailBody(),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
