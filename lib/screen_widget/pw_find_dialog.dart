import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

class PwFindDialog extends StatefulWidget {
  const PwFindDialog({Key? key}) : super(key: key);

  @override
  State<PwFindDialog> createState() => _PwFindDialogState();
}

class _PwFindDialogState extends State<PwFindDialog> {
  bool _obs1 = true;
  bool _obs2 = true;
  late IdPwFindProvider _idPwFindProvider;

  @override
  void initState() {
    super.initState();
    _idPwFindProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 280.h,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserJoinText(text: "비밀번호 변경"),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: TextFormField(
                      style: TextStyle(fontSize: 12.sp),
                      onChanged: (text) => {
                        _idPwFindProvider.setPw(text),
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                      ],
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obs1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        hintText: "비밀번호를 입력해 주세요.",
                        hintStyle:
                        TextStyle(fontSize: 12.sp, color: Color(0xffC1C1C1)),
                        contentPadding:
                        EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 7.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: 28.w,
                              color: _obs1 == true ? Colors.grey : const Color(0xff0099FF),
                            ),
                            onPressed: () {
                              _obs1 = !_obs1;
                              setState(() {

                              });
                            },
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(
                                color: const Color(0xff0099FF), width: 2.w)),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h,),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: TextFormField(
                      style: TextStyle(fontSize: 12.sp),
                      obscureText: _obs2,
                      onChanged: (text) => {
                        _idPwFindProvider.setRePw(text),
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                      ],
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        hintText: "비밀번호를 다시 입력해 주세요.",
                        hintStyle:
                        TextStyle(fontSize: 12.sp, color: Color(0xffC1C1C1)),
                        contentPadding:
                        EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 7.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: 28.w,
                              color: _obs2 == true ? Colors.grey : const Color(0xff0099FF),
                            ),
                            onPressed: () {
                              _obs2 = !_obs2;
                              setState(() {

                              });
                            },
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(
                                color: const Color(0xff0099FF), width: 2.w)),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h,),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xff707070),
                            letterSpacing: -0.25.w),
                        children: [
                          TextSpan(
                              text:
                              "비밀번호는 영문자로 시작하여야 하고 띄어쓰기 없는 영문,숫자,특수문자를 사용한 8자리 이상을 조합하여 입력해 주세요."),
                        ]),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _idPwFindProvider.pwClear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "취소",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff343434),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      80.w,
                      30.h,
                    ),
                    primary: Color(0xffC1C1C1),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    List<dynamic> resultList = _idPwFindProvider.checkPw();
                    if(resultList[0]) {
                      bool result = await _idPwFindProvider.changePw();
                      if(!result) {
                        showToast("비밀번호는 영문자로 시작하여야 하고 띄어쓰기 없는 영문,숫자,특수문자를 사용한 8자리 이상을 조합하여 입력해 주세요.", ToastGravity.CENTER);
                        return;
                      }
                      _idPwFindProvider.pwClear();
                      showToast("비밀번호 변경에 성공하였습니다.", ToastGravity.BOTTOM);
                      Navigator.pop(context);
                    } else {
                      showToast(resultList[1], ToastGravity.CENTER);
                    }
                  },
                  child: Text(
                    "변경",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      80.w,
                      30.h,
                    ),
                    primary: Color(0xff343434),
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}