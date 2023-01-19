import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';
import 'package:shinhanapp/repository/apply_change_repository.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

import '../screen/user_attendance_screen.dart';
import 'apply_cancel_dialog.dart';

class MyPageLectureListItemsBt2 extends StatelessWidget {
  final int index;

  const MyPageLectureListItemsBt2({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPageProvider myPageProvider = context.read();
    LoginProvider loginProvider = context.read();
    ApplyChangeRepository applyChangeRepository = ApplyChangeRepository();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return ApplyCancelDialog(
                    listItemIndex: index,
                  );
                });
            return;
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              136.w,
              32.h,
            ),
            backgroundColor: const Color(0xffD2D2D2),
          ),
          child: Text(
            "신청취소",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: const Color(0xff343434),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserAttendanceScreen(listIndex: index)));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              136.w,
              32.h,
            ),
            backgroundColor: const Color(0xff0099FF),
          ),
          child: Text(
            "상세보기",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}


