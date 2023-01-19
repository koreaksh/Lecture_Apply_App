import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/lecture_info_provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:shinhanapp/screen_widget/appbar_black_close.dart';
import 'package:shinhanapp/screen_widget/lecture_detail_sub_title.dart';

import '../screen_widget/lecture_detail_body.dart';
import '../screen_widget/lecture_dialog.dart';
import '../screen_widget/uijeongbu_logo_appbar.dart';

class LectureDetailScreen extends StatefulWidget {
  //리스트 강의리스트에대한 클릭한 강의 인덱스.
  final int index;

  const LectureDetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<LectureDetailScreen> createState() => _LectureDetailScreenState();
}

class _LectureDetailScreenState extends State<LectureDetailScreen> {
  late LectureInfoProvider lectureInfoProvider;
  late LoginProvider loginProvider;

  @override
  void initState() {
    super.initState();
    lectureInfoProvider = context.read();
    lectureInfoProvider.loadLectureInfo(widget.index);
    loginProvider = context.read();
  }

  @override
  void dispose() {
    super.dispose();
    lectureInfoProvider.clear();
  }

  @override
  Widget build(BuildContext context) {

    print("빌드 : LectureDetailScreen");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "강의과정 상세",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
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
                      color: Color(0xff343434),
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
                    "강의과정상세",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff020202),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const LectureDetailBody(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0099FF),
                  minimumSize: Size(double.infinity, 45.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.r),
                  ),
                ),
                child: Text(
                  "강의신청",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (loginProvider.loginModel == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          //this right here
                          child: LectureDialog(
                            lectureIndex: widget.index,
                            detailScreenContext: context,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}


