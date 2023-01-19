import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';

import '../screen/my_page_lecture_screen.dart';
import '../screen/teacherScreen/teacher_lesson_apply_screen.dart';

class MyPageLectureList extends StatefulWidget {
  const MyPageLectureList({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPageLectureList> createState() => _MyPageLectureListState();
}

class _MyPageLectureListState extends State<MyPageLectureList> {
  @override
  Widget build(BuildContext context) {
    MyPageProvider myPageProvider = context.read();
    LoginProvider loginProvider = context.read();
    bool typeCheck = loginProvider.typeCheck();

    print("빌드 : MyPageLectureList");
    return Column(
      children: [
        InkWell(
          onTap: () {
            myPageProvider.setCoiceIndex("0");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => typeCheck ? MyPageLectureScreen() : TeacherLessonApplyScreen(),
              ),
            ).then(
              (value) {
                setState(() {

                });
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffE2E2E2),
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 30.w,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        loginProvider.typeCheck() ? "수강신청 내역" : "신청 수강자 관리",
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: -0.25.sp,
                          color: Color(0xff343434),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Consumer<MyPageProvider>(
                        builder: (context, provider, widget) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "수강신청 ",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff020202),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${provider.applyCount}건",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0099FF),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/my/lecture_apply_image.svg",
                    height: 50.sp,
                    width: 65.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            myPageProvider.setCoiceIndex("1");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => typeCheck ? MyPageLectureScreen() : TeacherLessonApplyScreen(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffE2E2E2),
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 30.w,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        "나의 강의현황",
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: -0.25.sp,
                          color: Color(0xff343434),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Consumer<MyPageProvider>(
                        builder: (context, provider, widget) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "수강중 ",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff020202),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${provider.studyIngCount}건",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0099FF),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/my/lecture_studying_image.svg",
                    height: 44.sp,
                    width: 65.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            myPageProvider.setCoiceIndex("2");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => typeCheck ? MyPageLectureScreen() : TeacherLessonApplyScreen(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffE2E2E2),
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 44.w,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        "나의 강의현황",
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: -0.25.sp,
                          color: Color(0xff343434),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Consumer<MyPageProvider>(
                        builder: (context, provider, widget) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "수강완료 ",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff020202),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: " ${provider.completeCount}건",
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0099FF),
                                    letterSpacing: -0.25.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/my/lecture_complete_image.svg",
                    height: 44.sp,
                    width: 32.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
