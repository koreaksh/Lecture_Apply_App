import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/user_pw_edit_provider.dart';
import 'package:shinhanapp/repository/user_pw_edit_repository.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

import '../screen_widget/appbar_black_close.dart';

class UserPwEditScreen extends StatefulWidget {
  const UserPwEditScreen({Key? key}) : super(key: key);

  @override
  State<UserPwEditScreen> createState() => _UserPwEditScreenState();
}

class _UserPwEditScreenState extends State<UserPwEditScreen> {
  bool _currentPwObs = true;
  bool _changePwObs = true;
  bool _reChangePwObs = true;

  TextEditingController _currentPwFieldController = TextEditingController();
  TextEditingController _changePwFieldController = TextEditingController();
  TextEditingController _reChangePwFieldController= TextEditingController();

  late UserPwEditProvider userPwEditProvider;


  @override
  void dispose() {
    super.dispose();
    userPwEditProvider.clear();
  }

  @override
  Widget build(BuildContext context) {
    userPwEditProvider = context.read();
    LoginProvider loginProvider = context.read();

    print("빌드 : UserPwEditScreen");
    return Scaffold(
      appBar: AppBar(
        leading: UijeongbuLogoAppbar(blackLogo: true,),
        centerTitle: true,
        title: Text(
          "비밀번호 변경",
          style: TextStyle(
            color: Color(0xff020202),
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          AppbarBlackClose()
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              UserJoinText(text: "현재 비밀번호"),
              SizedBox(
                height: 7.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextFormField(
                  onChanged: (text) => {
                    userPwEditProvider.setCurrentPw(text),
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                  ],
                  obscureText: _currentPwObs,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(color: Color(0xffE2E2E2)),
                    ),
                    hintText: "현재 비밀번호를 입력해 주세요.",
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
                          color: _currentPwObs == true ? Color(0xffC1C1C1) : Colors.green,
                          //Colors.green <체크색상
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPwObs = !_currentPwObs;
                          });
                        },
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                            color: const Color(0xff0099FF), width: 2.w)),
                  ),
                  controller: _currentPwFieldController,
                ),
              ),
              SizedBox(height: 29.h),
              UserJoinText(text: "변경 비밀번호"),
              SizedBox(
                height: 7.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextFormField(
                  onChanged: (text) => {
                    userPwEditProvider.setChangePw(text),
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                  ],
                  obscureText: _changePwObs,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(color: Color(0xffE2E2E2)),
                    ),
                    hintText: "변경하실 비밀번호를 입력해 주세요.",
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
                          color: _changePwObs == true ? Color(0xffC1C1C1) : Colors.green,
                          //Colors.green <체크색상
                        ),
                        onPressed: () {
                          setState(() {
                            _changePwObs = !_changePwObs;
                          });
                        },
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                            color: const Color(0xff0099FF), width: 2.w)),
                  ),
                  controller: _changePwFieldController,
                ),
              ),
              SizedBox(height: 7.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextFormField(
                  onChanged: (text) => {
                    userPwEditProvider.setReChangePw(text),
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                  ],
                  obscureText: _reChangePwObs,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(color: Color(0xffE2E2E2)),
                    ),
                    hintText: "비밀번호를 다시 입력해 주세요.",
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
                          color: _reChangePwObs == true ? Color(0xffC1C1C1) : Colors.green,
                          //Colors.green <체크색상
                        ),
                        onPressed: () {
                          setState(() {
                            _reChangePwObs = !_reChangePwObs;
                          });
                        },
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                            color: const Color(0xff0099FF), width: 2.w)),
                  ),
                  controller: _reChangePwFieldController,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Text(
                      "비밀번호는 영문자로 시작하여야 하고 띄어쓰기 없는 영문,숫자,특수문자를 사용한 8자리 이상을 조합하여 입력해 주세요.",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff707070),
                          letterSpacing: -0.25.w),
                    ),
                    SizedBox(height: 48.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45.h),
                        primary: const Color(0xff0099FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.r),
                        ),
                      ),
                      onPressed: () async {
                        //비밀번호 변경할지 안할지 체크
                        List check = userPwEditProvider.checkPw();
                        if(check[0]) {
                          List result = await userPwEditProvider.changePw(loginProvider.loginModel!.getUserIndex());
                          if(result[0]) {
                            _showToast("정상적으로 정보가 변경되었습니다.");
                            userPwEditProvider.clear();
                            _clearTextFiled();
                          } else {
                            _showToast(result[1]);
                          }
                        } else {
                          _showToast(check[1]);
                        }
                      },
                      child: Text(
                        "변경",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xff6E6E6E),
        fontSize: 13.sp,
        toastLength: Toast.LENGTH_SHORT);
  }

  _clearTextFiled() {
    _currentPwFieldController.clear();
    _changePwFieldController.clear();
    _reChangePwFieldController.clear();
  }
}


