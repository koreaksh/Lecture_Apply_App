import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//강의페이쪽 담당자, 강의기간 등등 메세지 위젯..

class LectureTextTool extends StatelessWidget {
  final String text;
  const LectureTextTool({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 12.sp, color: Color(0xff707070),),);
  }
}