
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyPageLectureListHead extends StatelessWidget {
  const MyPageLectureListHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 160.h,
          color: Color(
            0xff0099FF,
          ),
        ),
        Positioned(
          top: 9.h,
          left: 207.w,
          child: SvgPicture.asset(
            "assets/lesson/lesson_apply_book.svg",
            width: 167.sp,
            height: 126.sp,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ],
    );
  }
}