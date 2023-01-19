import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../provider/join_condition_provider.dart';

class JoinConditionType extends StatefulWidget {
  const JoinConditionType({Key? key}) : super(key: key);

  @override
  State<JoinConditionType> createState() => _JoinConditionTypeState();
}

class _JoinConditionTypeState extends State<JoinConditionType> {
  late JoinConditionProvider _joinConditionProvider;

  @override
  void initState() {
    super.initState();
    _joinConditionProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : JoinConditionType");
    return Row(
      children: [
        InkWell(
          onTap: (){
            _joinConditionProvider.changeTypeTrue();
            setState(() {

            });
          },
          child: Container(
            height: 160.h,
            width: 155.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                  color: Color(
                    0xffE2E2E2,
                  ),
                  width: 1),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  width: 70.sp,
                  height: 70.sp,
                  decoration: BoxDecoration(
                    color: _joinConditionProvider.typeCheck == true ? Color(0xff0099FF):Color(0xffC1C1C1),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: SvgPicture.asset("assets/login/join_condition_1.svg",
                      fit: BoxFit.scaleDown),
                ),
                const Spacer(),
                Text(
                  "일반회원",
                  style: TextStyle(
                    color: _joinConditionProvider.typeCheck == true ? Color(0xff0099FF):Color(0xff707070),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: (){
            _joinConditionProvider.changeTypeFalse();
            setState(() {

            });
          },
          child: Container(
            height: 160.h,
            width: 155.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                  color: Color(
                    0xffE2E2E2,
                  ),
                  width: 1),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  width: 70.sp,
                  height: 70.sp,
                  decoration: BoxDecoration(
                    color: _joinConditionProvider.typeCheck == false ? Color(0xff0099FF):Color(0xffC1C1C1),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: SvgPicture.asset("assets/login/join_condition_2.svg",
                      fit: BoxFit.scaleDown),
                ),
                const Spacer(),
                Text(
                  "강사회원",
                  style: TextStyle(
                    color: _joinConditionProvider.typeCheck == false ? Color(0xff0099FF):Color(0xff707070),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}