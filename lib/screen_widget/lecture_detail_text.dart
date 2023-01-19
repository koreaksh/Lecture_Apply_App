import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//강의상세정보에서 강의시간을 동적으로 처리하기 위해서 만든 위젯

class LectureDetailText extends StatelessWidget {
  final String text;

  const LectureDetailText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : LectureDetailText");
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.25.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
