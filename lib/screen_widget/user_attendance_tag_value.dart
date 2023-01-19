import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consttants.dart';

class UserAttendanceTagValue extends StatelessWidget {
  final String value;
  final String type;
  const UserAttendanceTagValue({
    Key? key, required this.value, required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.25.sp,
              color: black02,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 2)),
          TextSpan(
            text: type,
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xff707070),
            ),
          ),
        ],
      ),
    );
  }
}