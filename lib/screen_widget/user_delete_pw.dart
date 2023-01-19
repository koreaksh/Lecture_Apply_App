import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

class UserDeletePw extends StatefulWidget {
  const UserDeletePw({Key? key}) : super(key: key);

  @override
  State<UserDeletePw> createState() => _UserDeletePwState();
}

class _UserDeletePwState extends State<UserDeletePw> {
  bool obs = true;
  late UserDeleteProvider _userDeleteProvider;

  @override
  Widget build(BuildContext context) {
    _userDeleteProvider = context.read();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserJoinText(text: "비밀번호"),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          width: 320.w,
          height: 50.h,
          child: TextFormField(
            onChanged: (text) => {
              _userDeleteProvider.setPw(text),
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
            ],
            obscureText: obs,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2)),
              ),
              hintText: "비밀번호를 입력해 주세요.",
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
              contentPadding:
                  EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 28.w,
                    color: obs == true ? Colors.grey : const Color(0xff0099FF),
                  ),
                  onPressed: () {
                    obs = !obs;
                    setState(() {

                    });
                  },
                ),
              ),
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
