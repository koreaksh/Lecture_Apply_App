import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';

class IdPwFindHead extends StatefulWidget {
  const IdPwFindHead({Key? key}) : super(key: key);

  @override
  State<IdPwFindHead> createState() => _IdPwFindHeadState();
}

class _IdPwFindHeadState extends State<IdPwFindHead> {
  late IdPwFindProvider _idPwFindProvider;

  @override
  void dispose() {
    super.dispose();
    _idPwFindProvider.clear();
  }

  @override
  void initState() {
    super.initState();
    _idPwFindProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : IdPwFindHead");
    //true 아이디찾기 / false 비밀번호찾기
    final idPwChoice = context.select((IdPwFindProvider e) => e.idPwChoice);
    return Row(
      children: [
        InkWell(
          onTap: () {
            _idPwFindProvider.idChoice();
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
                    color: idPwChoice == true
                        ? Color(0xff0099FF)
                        : Color(0xffC1C1C1),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: SvgPicture.asset(
                      "assets/login/join_condition_1.svg",
                      fit: BoxFit.scaleDown),
                ),
                const Spacer(),
                Text(
                  "아이디 찾기",
                  style: TextStyle(
                    color: idPwChoice == true
                        ? Color(0xff0099FF)
                        : Color(0xff707070),
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
          onTap: () {
            _idPwFindProvider.pwChoice();
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
                    color: idPwChoice == false
                        ? Color(0xff0099FF)
                        : Color(0xffC1C1C1),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: SvgPicture.asset(
                      "assets/login/lock.svg",
                      fit: BoxFit.scaleDown),
                ),
                const Spacer(),
                Text(
                  "비밀번호 찾기",
                  style: TextStyle(
                    color: idPwChoice == false
                        ? Color(0xff0099FF)
                        : Color(0xff707070),
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