import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screen_widget/join_condition_bt.dart';
import '../screen_widget/join_condition_check.dart';
import '../screen_widget/join_condition_type.dart';

class JoinConditionScreen extends StatelessWidget {
  const JoinConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : JoinConditionScreen");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "개인정보 취급방침 동의",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Color(0xff020202)),
        ),
        leading: BackButton(
          color: Color(0xff707070),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 0),
              child: Column(
                children: [
                  JoinConditionCheck(),
                  SizedBox(
                    height: 30.h,
                  ),
                  JoinConditionType(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
            Spacer(),
            JoinConditionBt(),
          ],
        ),
      ),
    );
  }
}


