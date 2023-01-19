import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/lesson_rec_check.dart';
import 'package:shinhanapp/screen_widget/show_map.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';

import '../provider/login_provider.dart';
import '../provider/my_page_provider.dart';
import '../screen_widget/main_page_top_body.dart';
import '../screen_widget/my_page_lecture_list_body.dart';
import '../screen_widget/my_page_lecture_list_items.dart';
import '../screen_widget/user_drawer.dart';

class MyPageLectureScreen extends StatefulWidget {
  const MyPageLectureScreen({Key? key}) : super(key: key);

  @override
  State<MyPageLectureScreen> createState() => _MyPageLectureScreenState();
}

class _MyPageLectureScreenState extends State<MyPageLectureScreen> {
  @override
  Widget build(BuildContext context) {
    print("빌드 : MyPageLectureScreen");

    MyPageProvider myPageProvider = context.watch();

    return Scaffold(
      appBar: AppBar(
        leading: const UijeongbuLogoAppbar(),
        leadingWidth: 70,
        centerTitle: true,
        title: Text(
          myPageProvider.getTitle(),
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff0099FF),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
              ))
        ],
      ),
      body: MyPageLectureListBody(),
    );
  }
}





