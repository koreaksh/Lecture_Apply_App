import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainText extends StatelessWidget {
  const MainText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "내 삶을 바꾸는 교육",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SvgPicture.asset(
          "assets/main/main_text.svg",
          width: 210.sp,
          height: 89.sp,
        ),
      ],
    );
  }
}