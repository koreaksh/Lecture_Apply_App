import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String text, ToastGravity gravity) {
  Fluttertoast.showToast(
      msg: text,
      gravity: gravity,
      backgroundColor: const Color(0xff6E6E6E),
      fontSize: 13.sp,
      toastLength: Toast.LENGTH_SHORT);
}