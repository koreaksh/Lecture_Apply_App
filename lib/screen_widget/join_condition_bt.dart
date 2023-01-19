import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/join_condition_provider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

import '../screen/user_join_screen.dart';

class JoinConditionBt extends StatelessWidget {
  const JoinConditionBt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinConditionProvider joinConditionProvider = context.read();

    return ElevatedButton(
      onPressed: () {
        if (!joinConditionProvider.conditionCheck) {
          showToast("개인정보 취급방침에 동의해 주세요.", ToastGravity.BOTTOM);
          return;
        }
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserJoinScreen()))
            .then(
          (value) => Navigator.pop(context),
        );
      },
      child: Text(
        "다음",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60.h),
      ),
    );
  }
}
