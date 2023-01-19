import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

class PwFindBody extends StatelessWidget {
  const PwFindBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IdPwFindProvider idPwFindProvider = context.read();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserJoinText(text: "아이디"),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r"^[a-zA-Z][a-zA-Z0-9]{0,19}")),
            ],
            onChanged: (id) {
              idPwFindProvider.setId(id);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(color: Color(0xffE2E2E2)),
              ),
              hintText: "아이디를 입력해 주세요.",
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
              contentPadding:
              EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide:
                  BorderSide(color: const Color(0xff0099FF), width: 2.w)),
            ),
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
        const UserJoinText(text: "이름"),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: TextFormField(
            onChanged: (value) {
              idPwFindProvider.setName(value);
            },
            inputFormatters: [
              FilteringTextInputFormatter(RegExp(r"^[a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]{0,8}"),
                  allow: true)
            ],
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2)),
              ),
              hintText: "이름을 입력해 주세요.",
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
              contentPadding:
              EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide:
                  BorderSide(color: const Color(0xff0099FF), width: 2.w)),
            ),
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
        UserJoinText(text: "이메일"),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: TextFormField(
            onChanged: (value) {
              idPwFindProvider.setEmail(value);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2)),
              ),
              hintText: "이메일 주소를 입력해 주세요.",
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
              contentPadding:
              EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  borderSide:
                  BorderSide(color: const Color(0xff0099FF), width: 2.w)),
            ),
          ),
        ),
      ],
    );
  }
}