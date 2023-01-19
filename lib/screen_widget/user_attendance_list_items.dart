import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/user_attendance_provider.dart';

import '../consttants.dart';

class UserAttendanceListItems extends StatelessWidget {
  final int itemIndex;
  const UserAttendanceListItems({Key? key, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAttendanceProvider userAttendanceProvider = context.read();
    return Container(
      height: 32.h,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: grayE2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 40,
            child: Text(
              "${itemIndex+1}",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.25.sp,
                color: const Color(0xff0099FF),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 80,
            child: Text(
              userAttendanceProvider.getDate(itemIndex),
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.25.sp,
                color: const Color(0xff343434),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 112,
            child: Text(
              "${userAttendanceProvider.getAddress()}\n${userAttendanceProvider.addressDetail}",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.25.sp,
                color: const Color(0xff343434),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          Expanded(
            flex: 88,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: userAttendanceProvider.getAttendanceStatusColor(itemIndex),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    userAttendanceProvider.getAttendanceStatusText(itemIndex),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.25.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}