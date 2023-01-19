import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';

import 'package:shinhanapp/screen/id_pw_find_screen.dart';
import 'package:shinhanapp/screen/join_condition_screen.dart';
import 'package:shinhanapp/screen/teacherScreen/teacher_navigation_screen.dart';


import '../screen_widget/show_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //로그인유지체크박스에서 쓰는거
  bool? isChecked = true;

  //비밀번호obs기능
  bool obs = true;

  //회원유형 true일반 / false강사
  bool loginType = true;

  late LoginProvider _loginProvider;

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : LoginScreen");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 100.h, 20.w, 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.w),
                  child: SvgPicture.asset(
                    "assets/login/login_logo.svg",
                    width: 224.w,
                    height: 120.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ///////////////////////////////////
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        loginType = true;
                        setState(() {});
                      },
                      child: Container(
                        height: 140.h,
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
                              width: 60.sp,
                              height: 60.sp,
                              decoration: BoxDecoration(
                                color: loginType == true
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
                              "일반회원",
                              style: TextStyle(
                                color: loginType == true
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
                        loginType = false;
                        setState(() {});
                      },
                      child: Container(
                        height: 140.h,
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
                              width: 60.sp,
                              height: 60.sp,
                              decoration: BoxDecoration(
                                color: loginType == false
                                    ? Color(0xff0099FF)
                                    : Color(0xffC1C1C1),
                                borderRadius: BorderRadius.circular(35.r),
                              ),
                              child: SvgPicture.asset(
                                  "assets/login/join_condition_2.svg",
                                  fit: BoxFit.scaleDown),
                            ),
                            const Spacer(),
                            Text(
                              "강사회원",
                              style: TextStyle(
                                color: loginType == false
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
                ),
                ///////////////////////////////////
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  onChanged: (value) {
                    _loginProvider.setId(value);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[a-zA-Z][a-zA-Z0-9]{0,19}")),
                  ],
                  textInputAction: TextInputAction.next,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "아이디",
                    hintStyle: const TextStyle(color: Color(0xffC1C1C1)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: const BorderSide(color: Color(0xffE2E2E2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                            color: const Color(0xff0099FF), width: 2.w)),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 26.h,
                    ),
                    suffixIcon: Icon(
                      Icons.check_circle,
                      size: 18.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  onChanged: (value) {
                    _loginProvider.setPw(value);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r"^[^가-힣ㄱ-ㅎㅏ-ㅣ\s]{0,20}")),
                  ],
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obs,
                  decoration: InputDecoration(
                    hintText: "비밀번호",
                    hintStyle: const TextStyle(color: Color(0xffC1C1C1)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: const BorderSide(color: Color(0xffE2E2E2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                            color: const Color(0xff0099FF), width: 2.w)),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      size: 26.h,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obs = !obs;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 24.h,
                        color: obs == false ? Color(0xff0099FF) : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 34.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: 19.h,
                        height: 19.h,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                          checkColor: const Color(0xff0099FF),
                          activeColor: Colors.white,
                          side: MaterialStateBorderSide.resolveWith((states) =>
                              const BorderSide(
                                  width: 1.0, color: Color(0x88707070))),
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        "로그인 상태 유지",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                  onPressed: () {
                    if (_loginProvider.checkIdPw()) {
                      _loginProvider.userLogin(loginType == true ? "일반회원" : "강사회원").then((value) => {
                            if (_loginProvider.resultStatus == "200")
                              {
                                // Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationScreen())),
                                if (isChecked!)
                                  {
                                    if(_loginProvider.loginModel!.getMemType() == "일반회원") {
                                      _saveUserData().then((value) {
                                        Navigator.pop(context);
                                      }),
                                    } else {
                                      _saveUserData().then((value) {
                                        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherNavigationScreen()));
                                        context.read<NavigationIndexProvider>().clearNavigation();
                                      }),
                                    }
                                  }
                                else
                                  {
                                    Navigator.pop(context),
                                  }
                              }
                            else
                              {
                                showToast("존재하지 않는 계정입니다.", ToastGravity.BOTTOM),
                              }
                          });
                    } else {
                      showToast("아이디와 비밀번호를 입력해 주세요.", ToastGravity.BOTTOM);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320.w, 55.h), backgroundColor: const Color(0xff0099FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.r)),
                  ),
                  child: Text(
                    "로그인",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60.w,
                    ),
                    SizedBox(
                      width: 100.w,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => IdPwFindScreen()));
                          },
                          child: Text(
                            "ID/PW찾기",
                            style: TextStyle(
                                fontSize: 14.sp, color: Color(0xff707070)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 34.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.w,
                            height: 16.h,
                            child: const VerticalDivider(
                              // thickness: 1,
                              color: Color(0xffE2E2E2),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(24.5.w, 8.h, 0.w, 9.h),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const JoinConditionScreen()));
                              },
                              child: Text(
                                "회원가입",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0099FF),
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(
        "shinHanAppUserIndex", _loginProvider.loginModel!.getUserIndex());
    pref.setBool("shinHanAppUserAutoLogin", true);
  }
}
