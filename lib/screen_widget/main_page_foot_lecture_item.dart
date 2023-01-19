import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPageFootLectureItem extends StatelessWidget {
  final String title;
  final String admin;
  final String date;

  const MainPageFootLectureItem({
    Key? key, required this.title, required this.admin, required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.25.sp,
            color: Color(0xff020202),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          height: 9.h,
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: 9.sp,
                color: const Color(0xffD2D2D2),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 27.w,
                child: Text(
                  admin,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 8.sp,
                    letterSpacing: -0.25.sp,
                    color: const Color(0xff020202),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.access_time_filled,
                size: 9.sp,
                color: const Color(0xffD2D2D2),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 8.sp,
                  letterSpacing: -0.25.sp,
                  color: const Color(0xff020202),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
