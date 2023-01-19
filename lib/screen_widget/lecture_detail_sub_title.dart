import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureDetailSubTitle extends StatelessWidget {
  final Widget textItem;
  const LectureDetailSubTitle({
    Key? key, required this.textItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
          height: 1,
        ),
        Container(
          height: 30.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 0),
                color: Color(0xffDBDDEE),
                spreadRadius: 0
              ),
            ],
          ),
          child: textItem,
        ),
      ],
    );
  }
}
