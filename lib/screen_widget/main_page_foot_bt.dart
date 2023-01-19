import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';

class MainPageFootBt extends StatelessWidget {
  const MainPageFootBt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : MainPageFootBt");

    NavigationIndexProvider navigationIndexProvider = context.read();

    return InkWell(
      child: Container(
        width: 125.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: const Color(0xff0099FF),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Row(
            children: [
              Text(
                "더 많은 강좌 보러가기",
                style: TextStyle(
                  fontSize: 10.sp,
                  letterSpacing: -0.2.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/main/main_arrow_image.svg",
                width: 12.sp,
                height: 4.sp,
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        navigationIndexProvider.setNavigationIndex(1);
      },
    );
  }
}