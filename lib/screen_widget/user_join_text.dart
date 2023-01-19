import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserJoinText extends StatelessWidget {
  final String text;
  const UserJoinText({
    Key? key, required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: Color(0xff020202)),
    );
  }
}
