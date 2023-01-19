import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';
import 'package:shinhanapp/provider/user_edit_provider.dart';
import 'package:shinhanapp/provider/user_edit_pw_check_provider.dart';

import 'package:shinhanapp/screen/user_delete_screen.dart';
import 'package:shinhanapp/screen/user_edit_screen.dart';
import 'package:shinhanapp/screen/user_pw_edit_screen.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';

import '../screen_widget/logout_dialog.dart';
import '../screen_widget/my_page_box.dart';
import '../screen_widget/my_page_lecture_list.dart';
import '../screen_widget/user_drawer.dart';
import '../screen_widget/user_edit_dialog.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  late LoginProvider _loginProvider;
  late MyPageProvider _myPageProvider;
  late UserEditProvider _userEditProvider;
  late UserEditPwCheckProvider _userEditPwCheckProvider;

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read();
    _myPageProvider = context.read();
    _userEditProvider = context.read();
    _userEditPwCheckProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    String userIndex = _loginProvider.loginModel!.getUserIndex();
    _loginProvider.typeCheck() ? _myPageProvider.loadMyPage(userIndex) : _myPageProvider.teacherLoadMyPage(userIndex);

    print("빌드 : MyPageScreen");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My 페이지",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff707070),
        ),
        elevation: 0,
        leading: UijeongbuLogoAppbar(
          blackLogo: true,
        ),
        leadingWidth: 70,
      ),
      endDrawer: UserDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),
              Row(
                children: [
                  SizedBox(
                    width: 50.sp,
                    height: 50.sp,
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 35.sp,
                      ),
                      backgroundColor: Color(0xff0099FF),
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              _loginProvider.loginModel?.getUserName() ?? "사용자",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff020202),
                          ),
                        ),
                        TextSpan(
                          text: " 님",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Color(0xff020202),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff343434),
                        width: 0.7,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.sp,
                        vertical: 3.sp,
                      ),
                      child: Text(
                        _loginProvider.loginModel!.getMemType(),
                        style: TextStyle(
                          fontSize: 9.sp,
                          letterSpacing: -0.25.sp,
                          color: Color(0xff343434),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              MyPageLectureList(),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return UserEditDialog();
                    },
                  ).then((value) {
                    //사용자가 비밀번호 확인을 눌렀는지 확인 누르지않고 취소눌렀을시 바로 return
                    if (!_userEditPwCheckProvider.tryCheck) return;
                    if (_userEditPwCheckProvider.pwCheck) {
                      _userEditPwCheckProvider.clear();
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserEditScreen()))
                          .then((value) {
                        _userEditProvider.clearData();
                        _userEditProvider.setUserDataEditCheckFalse();
                        setState(() {});
                      });
                    } else {
                      showToast("비밀번호가 올바르지 않습니다.", ToastGravity.BOTTOM);
                      _userEditPwCheckProvider.clear();
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 54.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE2E2E2)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: MyPageBox(
                    text: "회원정보 변경",
                    svgImage: SvgPicture.asset(
                      "assets/my/my_user_edit.svg",
                      width: 32.sp,
                      height: 32.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPwEditScreen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 54.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE2E2E2)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: MyPageBox(
                    text: "비밀번호 변경",
                    svgImage: SvgPicture.asset(
                      "assets/my/my_pw_edit.svg",
                      width: 24.sp,
                      height: 33.sp,
                    ),
                    endWidth: 34,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UserDeleteScreen()));
                    },
                    child: Text(
                      "회원탈퇴",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.25.sp,
                        color: Color(0xff343434),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffE2E2E2),
                      elevation: 0.0,
                      minimumSize: Size(155.w, 40.h),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return LogoutDialog();
                        },
                      );
                    },
                    child: Text(
                      "로그아웃",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.25.sp,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff343434),
                      elevation: 0.0,
                      minimumSize: Size(155.w, 40.h),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}


