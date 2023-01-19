import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TeacherLessonApplyBodyTop extends StatelessWidget {
  const TeacherLessonApplyBodyTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144.h,
      width: double.infinity,
      color: const Color(0xff0099FF),
      child: Stack(
        children: [
          Positioned(
            top: 16.h,
            left: 11.w,
            child: SizedBox(
              width: 153.sp,
              height: 153.sp,
              child: SvgPicture.asset(
                "assets/lesson/lesson_people_image.svg",
              ),
            ),
          ),
          Positioned(
            top: 32.h,
            right: 27.w,
            child: Text(
              "내 삶을 바꾸는 교육",
              style: TextStyle(
                fontSize: 16.sp,
                letterSpacing: -0.25.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 58.h,
            right: 20.w,
            child: SizedBox(
              width: 145.w,
              height: 62.h,
              child: SvgPicture.asset(
                "assets/main/main_text.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
