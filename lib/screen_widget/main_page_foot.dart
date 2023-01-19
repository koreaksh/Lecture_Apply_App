import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'main_page_foot_bt.dart';
import 'main_page_foot_lecture.dart';

class MainPageFoot extends StatelessWidget {
  const MainPageFoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 157.h,
      color: const Color(0xffF5F5F5),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, top: 14.h, right: 18.w),
        child: Row(
          children: [
            SizedBox(
              width: 190.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "이런 강좌는 어떠세요?",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0099FF),
                        letterSpacing: -0.25.sp),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  MainPageFootLecture(),
                  SizedBox(
                    height: 15.h,
                  ),
                  MainPageFootBt(),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SvgPicture.asset(
                "assets/main/main_bottom_image.svg",
                width: 105.sp,
                height: 127.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


