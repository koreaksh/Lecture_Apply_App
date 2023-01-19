import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/user_edit_pw_check_provider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

class UserEditDialog extends StatefulWidget {
  const UserEditDialog({Key? key}) : super(key: key);

  @override
  State<UserEditDialog> createState() => _UserEditDialogState();
}

class _UserEditDialogState extends State<UserEditDialog> {
  bool _obsMode = true;
  late UserEditPwCheckProvider _userEditPwCheckProvider;
  late LoginProvider _loginProvider;

  @override
  void initState() {
    super.initState();
    _userEditPwCheckProvider = context.read();
    _loginProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 160.h,
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
                  UserJoinText(text: "비밀번호 확인"),
                  SizedBox(height: 7.h,),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: TextFormField(
                      onChanged: (text) => {
                        _userEditPwCheckProvider.setPw(text),
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                      ],
                      obscureText: _obsMode,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        hintText: "비밀번호를 입력해 주세요.",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
                        contentPadding:
                            EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 7.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              size: 28.w,
                              color: _obsMode == true
                                  ? Color(0xffC1C1C1)
                                  : Color(0xff0099FF)
                              //Colors.green <체크색상
                            ),
                            onPressed: () {
                              _obsMode = !_obsMode;
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
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _userEditPwCheckProvider.clear();
                    _userEditPwCheckProvider.tryClear();
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
                  onPressed: () {
                    if(_userEditPwCheckProvider.pw == "") {
                      showToast("비밀번호를 입력해 주세요.", ToastGravity.BOTTOM);
                      return;
                    }
                    //비밀번호가 맞는지 아닌지 체크 하고 바로 다이얼로그 닫음.
                   _userEditPwCheckProvider.userPwCheck(_loginProvider.loginModel!.getUserIndex()).then((value) => Navigator.pop(context));
                  },
                  child: Text(
                    "확인",
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
