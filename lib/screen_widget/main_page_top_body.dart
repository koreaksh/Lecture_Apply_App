import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shinhanapp/screen_widget/main_text.dart';

import 'main_current_text.dart';
import 'main_page_body.dart';

class MainPageTopBody extends StatelessWidget {
  final Widget svgImage;

  const MainPageTopBody({
    Key? key,
    required this.svgImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 240.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.r),
              bottomRight: Radius.circular(50.r),
            ),
            color: const Color(0xff0099ff),
          ),
        ),
        svgImage,
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainText(),
              SizedBox(
                height: 68.h,
              ),
              Text(
                "의정부시x신한대학교",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0xaaffffff),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MainPageBody(),
            ],
          ),
        ),
      ],
    );
  }
}


