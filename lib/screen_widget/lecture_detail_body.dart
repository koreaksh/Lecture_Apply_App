import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/show_pdf.dart';

import '../provider/lecture_info_provider.dart';
import 'lecture_detail_admin_bt.dart';
import 'lecture_detail_text.dart';
import 'lecture_text_tool.dart';
import 'lesson_rec_check.dart';

class LectureDetailBody extends StatelessWidget {
  const LectureDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("빌드 : LectureDetailBody");
    }
    return Consumer<LectureInfoProvider>(
      builder: (context, provider, widget) {
        if (provider.lectureInfo != null &&
            provider.lectureDetailInfo != null) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.grey[100],
                    image: DecorationImage(
                      image: NetworkImage(
                        provider.lectureInfo!.getImage(),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.r),
                        color: Colors.white,
                        border: Border.all(color: const Color(0xff343434)),
                      ),
                      child: Center(
                        child: Text(
                          provider.lectureInfo!.getPay(),
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xff343434),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    LessonRecCheck(
                      text: provider.lectureInfo!.getComplete(),
                      color: provider.lectureInfo!.getComplete() == "모집완료"
                          ? const Color(0xff37B700)
                          : const Color(0xffFF9100),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    provider.lectureInfo!.getTitle(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(provider.lectureInfo!.getDescription()),
                ),
                SizedBox(
                  height: 18.h,
                  width: 10,
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    const LectureTextTool(text: "담당강사"),
                    SizedBox(
                      width: 19.w,
                    ),
                    Text(
                      provider.lectureInfo!.getAdmin(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const LectureDetailAdminBt(),
                  ],
                ),
                // SizedBox(
                //   height: 20.h,
                // ),
                Row(
                  children: [
                    const LectureTextTool(text: "신청기간"),
                    SizedBox(
                      width: 19.w,
                    ),
                    Text(
                      "${provider.lectureInfo!.getRegisterStart()} - ${provider.lectureInfo!.getRegisterEnd()}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.25.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const LectureTextTool(text: "강의기간"),
                        Text(
                          "(택1)",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    Column(
                      children: [
                        for (int i = 1; i < provider.textList.length; i++)
                          LectureDetailText(text: provider.textList[i]),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    const LectureTextTool(text: "강의소개"),
                    SizedBox(
                      width: 19.w,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        showPdf(provider.lectureInfo!.getLectureAboutLink());
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0xff0099FF),
                          width: 1.sp,
                        ),
                        minimumSize: Size.zero,
                        padding: EdgeInsets.only(
                            left: 21.sp, top: 5.sp, right: 23.sp, bottom: 4.sp),
                      ),
                      child: Text(
                        "강의소개",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0099FF),
                          letterSpacing: -0.25.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    const LectureTextTool(text: "모집정원"),
                    SizedBox(
                      width: 19.w,
                    ),
                    Text(
                      "총${provider.lectureInfo!.getLimitedNum()}명 모집 / 선착순 마감",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.25.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  children: [
                    const LectureTextTool(text: "신청인원"),
                    SizedBox(
                      width: 19.w,
                    ),
                    Text(
                      "${provider.lectureInfo!.getNowApplyCount()}명",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}