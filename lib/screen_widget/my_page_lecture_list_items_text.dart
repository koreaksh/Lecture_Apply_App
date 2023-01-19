import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageLectureListItemsText extends StatelessWidget {
  final String text;

  const MyPageLectureListItemsText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: const Color(0xff707070),
        letterSpacing: -0.25.sp,
      ),
    );
  }
}