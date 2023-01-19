import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/join_condition_provider.dart';

import 'join_condition_head.dart';

class JoinConditionCheck extends StatelessWidget {
  const JoinConditionCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : JoinConditionCheck");
    JoinConditionProvider joinConditionProvider = context.read();
    joinConditionProvider.loadCondition();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffE2E2E2,),width: 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Column(
            children: [
              JoinConditionHead(
                title: "개인정보 취급방침",
                require: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Container(
                  height: 110.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 11.sp, right: 11.sp),
                    child: SingleChildScrollView(
                      child: Text(
                        "\n${context.select((JoinConditionProvider e) => e.conditionText)}" ,
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: -0.25.sp,
                          color: Color(0xff6E6E6E),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}




