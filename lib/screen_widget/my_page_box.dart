import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyPageBox extends StatelessWidget {
  final String text;
  final SvgPicture svgImage;
  final int? endWidth;
  const MyPageBox({
    Key? key,
    required this.text,
    required this.svgImage,
    this.endWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? width = endWidth;
    return Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            letterSpacing: -0.25.sp,
            color: Color(0xff020202),
          ),
        ),
        const Spacer(),
        svgImage,
        SizedBox(
          width: width == null ? 31.w : width.w,
        ),
      ],
    );
  }
}