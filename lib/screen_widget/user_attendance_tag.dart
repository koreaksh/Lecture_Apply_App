import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinhanapp/screen_widget/user_attendance_tag_box.dart';
import 'package:shinhanapp/screen_widget/user_attendance_tag_value.dart';

import '../consttants.dart';

class UserAttendanceTag extends StatelessWidget {
  final String title;
  final Color titleBackColor;
  final String value;
  final String type;
  const UserAttendanceTag({
    Key? key, required this.title, required this.value, required this.type, required this.titleBackColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: grayE2,
          ),
        ),
        child: Row(
          children: [
            UserAttendanceTagBox(
              text: title,
              color: titleBackColor,
            ),
            const Spacer(),
            UserAttendanceTagValue(value: value, type: type,),
            SizedBox(
              width: 5.w,
            ),
          ],
        ),
      ),
    );
  }
}