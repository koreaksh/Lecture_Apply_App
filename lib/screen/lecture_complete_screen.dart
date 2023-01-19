import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/model/lecture_apply_model.dart';
import 'package:shinhanapp/provider/lecture_apply_provider.dart';
import 'package:shinhanapp/screen_widget/appbar_black_close.dart';
import 'package:shinhanapp/screen_widget/lecture_text_tool.dart';
import 'package:date_format/date_format.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';

import '../screen_widget/lecture_detail_sub_title.dart';

class LectureCompleteScreen extends StatelessWidget {
  const LectureCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : LectureCompleteScreen");
    LectureApplyProvider lectureApplyProvider = context.read();
    late LectureApplyModel? applyData;
    if(lectureApplyProvider.lectureApplyModel != null) {
      applyData = lectureApplyProvider.lectureApplyModel;
    }
    DateTime now = DateTime.now();
    String date = formatDate(now, [yyyy, "-", mm, "-", dd]);
    String time = formatDate(now, [HH, ":", nn]);
    return Scaffold(
      appBar: AppBar(
        leading: UijeongbuLogoAppbar(blackLogo: true,),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "강의신청",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff707070),
        ),
        elevation: 0,
        actions: const [
          AppbarBlackClose(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "강의신청",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff020202),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 113.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            "강의신청이 접수되었어요!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              letterSpacing: -0.25.sp,
                              color: Color(
                                0xff0099FF,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Color(0xff343434),
                                fontSize: 12.sp,
                                letterSpacing: -0.25.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: "담당자의 승인을 통해 접수가 진행,\n",
                                ),
                                TextSpan(text: "완료되어야 교육을 이수할 수 있습니다."),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/main/main_bottom_image.svg",
                        height: 113.sp,
                        width: 94.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE2E2E2)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          applyData?.getTitle() ?? "강의제목",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.25.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            LectureTextTool(text: "신청일"),
                            SizedBox(
                              width: 29.w,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  letterSpacing: -0.25.sp,
                                  color: Color(0xff020202),
                                ),
                                children: [
                                  TextSpan(text: date),
                                  TextSpan(
                                    text: "  |  ",
                                    style: TextStyle(color: Color(0xffC1C1C1)),
                                  ),
                                  TextSpan(text: time),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            LectureTextTool(text: "신청자"),
                            SizedBox(
                              width: 29.w,
                            ),
                            Text(
                              applyData?.getUserName()?? "신청자",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                letterSpacing: -0.25.sp,
                                color: Color(0xff020202),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45.h),
                      primary: Color(0xff0099FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
