import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageLectureListItemsValueText extends StatelessWidget {
  final String text;

  const MyPageLectureListItemsValueText({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xff020202),
      ),
    );
  }
}