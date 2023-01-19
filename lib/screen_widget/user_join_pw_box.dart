import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/join_pw_obs_check_provider.dart';
import 'package:shinhanapp/provider/pw_check_provider.dart';

class UserJoinPwBox extends StatelessWidget {
  final String text;
  final int widgetKey;

  const UserJoinPwBox({Key? key, required this.text, required this.widgetKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinPwObsCheckProvider joinPwObsCheckProvider = context.read();

    print("빌드 : user_join_pw_box");
    return SizedBox(
      width: 320.w,
      height: 50.h,
      child: TextFormField(
        onChanged: (text) => {
          if (widgetKey == 1)
            {
              context.read<PwCheckProvider>().setPw(text),
              context.read<PwCheckProvider>().checkText(),
            }
          else
            {
              context.read<PwCheckProvider>().setPwCheck(text),
              context.read<PwCheckProvider>().checkText(),
            }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
        ],
        obscureText: widgetKey == 1
            ? context.select((JoinPwObsCheckProvider e) => e.pwObs)
            : context.select((JoinPwObsCheckProvider e) => e.pwReObs),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(color: Color(0xffE2E2E2)),
          ),
          hintText: text,
          hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
          contentPadding: EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 7.w),
            child: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                size: 28.w,
                color: widgetKey == 1
                    ? context.select((JoinPwObsCheckProvider e) => e.pwObsColor)
                    : context
                        .select((JoinPwObsCheckProvider e) => e.pwReObsColor),
              ),
              onPressed: () {
                widgetKey == 1
                    ? joinPwObsCheckProvider.changePwObs()
                    : joinPwObsCheckProvider.changePwReObs();
              },
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide:
                  BorderSide(color: const Color(0xff0099FF), width: 2.w)),
        ),
      ),
    );
  }
}
