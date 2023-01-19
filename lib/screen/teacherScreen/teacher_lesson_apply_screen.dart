import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';
import 'package:shinhanapp/screen_widget/lesson_list_item.dart';

import '../../screen_widget/teacher_screen_widget/teacher_lesson_apply_body.dart';
import '../../screen_widget/teacher_screen_widget/teacher_lesson_apply_body_top.dart';
import '../../screen_widget/uijeongbu_logo_appbar.dart';

class TeacherLessonApplyScreen extends StatelessWidget {
  const TeacherLessonApplyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : TeacherLessonApplyScreen");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "강의목록",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
        ),
        elevation: 0,
        leading: const UijeongbuLogoAppbar(
          blackLogo: true,
        ),
        leadingWidth: 70,
        actions: const [
          CloseButton(),
        ],
      ),
      body: const SafeArea(child: TeacherLessonApplyBody()),
    );
  }
}




