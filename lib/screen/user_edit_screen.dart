import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/screen_widget/appbar_black_close.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

import '../provider/user_edit_provider.dart';

class UserEditScreen extends StatelessWidget {
  UserEditScreen({Key? key}) : super(key: key);
  final phoneFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final addressDetailFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.watch();
    UserEditProvider userEditProvider = context.read();

    print("빌드 : UserEditScreen");

    return Scaffold(
      appBar: AppBar(
        leading: UijeongbuLogoAppbar(
          blackLogo: true,
        ),
        centerTitle: true,
        title: Text(
          "회원정보 변경",
          style: TextStyle(
            color: Color(0xff020202),
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          AppbarBlackClose(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: UserJoinText(text: "기본정보"),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: Text(
                        "성명",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 200.w,
                      height: 33.h,
                      padding: EdgeInsets.only(left: 10.w,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: Color(0xffE2E2E2)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            loginProvider.loginModel!.getUserName(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color(0xffC1C1C1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: Text(
                        "연락처",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 33.h,
                      child: TextFormField(
                        onChanged: (value) {
                          userEditProvider.setUserPhoneNumber(value);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^[0-9]{0,11}")),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(color: Color(0xffE2E2E2)),
                          ),
                          hintText:
                              loginProvider.loginModel!.getUserPhoneNumber(),
                          hintStyle: TextStyle(
                              fontSize: 13.sp, color: Color(0xffC1C1C1)),
                          contentPadding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(
                                  color: const Color(0xff0099FF), width: 2.w)),
                        ),
                        controller: phoneFieldController,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        if (userEditProvider.checkUserPhoneNum(
                            loginProvider.loginModel!.getUserPhoneNumber())) {
                          bool check = await userEditProvider.loadUserPhoneEdit(
                              loginProvider.loginModel!.getUserIndex());
                          if (check) {
                            loginProvider.loginModel!.setUserPhoneNumber(
                                userEditProvider.userPhoneNumber);
                            loginProvider.changeCall();
                            userEditProvider.clearData();
                            _clearText();
                            userEditProvider.setUserDataEditCheckTrue();
                            _showToast("정상적으로 정보가 변경되었습니다.");
                          } else {
                            _showToast(userEditProvider.postMessage);
                          }
                        } else {
                          _showToast("변경될 정보가 없거나 동일합니다.");
                        }
                      },
                      child: Container(
                        height: 33.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                              color: const Color(0xff0099FF), width: 2.w),
                        ),
                        child: Center(
                            child: Text(
                          "변경",
                          style: TextStyle(
                            color: const Color(0xff0099FF),
                            fontSize: 12.sp,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: Text(
                        "이메일",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 33.h,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                        onChanged: (value) {
                          userEditProvider.setUserEmail(value);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(color: Color(0xffE2E2E2)),
                          ),
                          hintText: loginProvider.loginModel!.getUserEmail(),
                          hintStyle: TextStyle(
                              fontSize: 13.sp, color: Color(0xffC1C1C1)),
                          contentPadding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(
                                  color: const Color(0xff0099FF), width: 2.w)),
                        ),
                        controller: emailFieldController,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        if (userEditProvider.checkUserEmail(
                            loginProvider.loginModel!.getUserEmail())) {
                          bool check = await userEditProvider.loadUserEmailEdit(
                              loginProvider.loginModel!.getUserIndex());
                          if (check) {
                            loginProvider.loginModel!
                                .setUserEmail(userEditProvider.userEmail);
                            loginProvider.changeCall();
                            userEditProvider.clearData();
                            _clearText();
                            userEditProvider.setUserDataEditCheckTrue();
                            _showToast("정상적으로 정보가 변경되었습니다.");
                          } else {
                            _showToast(userEditProvider.postMessage);
                          }
                        } else {
                          _showToast("변경될 정보가 없거나 동일합니다.");
                        }
                      },
                      child: Container(
                        height: 33.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                              color: const Color(0xff0099FF), width: 2.w),
                        ),
                        child: Center(
                            child: Text(
                          "변경",
                          style: TextStyle(
                            color: const Color(0xff0099FF),
                            fontSize: 12.sp,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: UserJoinText(text: "주소 변경"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: Color(0xffE2E2E2)),
                      ),
                      hintText: userEditProvider.userAddress == ""
                          ? loginProvider.loginModel!.getUserAddress()
                          : userEditProvider.userAddress,
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: userEditProvider.userAddress == ""
                              ? Color(0xffC1C1C1)
                              : Colors.black),
                      contentPadding:
                          EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
                      suffixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10.h, 15.w, 10.h),
                        child: OutlinedButton(
                          onPressed: () async {
                            await userEditProvider
                                .loadAddressFindScreen(context);
                            loginProvider.changeCall();
                          },
                          child: Text(
                            "주소 검색",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0099FF)),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
                            side: BorderSide(color: Color(0xff0099FF)),
                          ),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                              color: const Color(0xff0099FF), width: 2.w)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 320.w,
                  height: 50.h,
                  child: TextFormField(
                    onChanged: (value) {
                      userEditProvider.setUserAddressDetail(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: Color(0xffE2E2E2)),
                      ),
                      hintText:
                          loginProvider.loginModel!.getUserAddressDetail(),
                      hintStyle:
                          TextStyle(fontSize: 14.sp, color: Color(0xffC1C1C1)),
                      contentPadding:
                          EdgeInsets.only(left: 20.w, top: 16.h, bottom: 17.h),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                              color: const Color(0xff0099FF), width: 2.w)),
                    ),
                    controller: addressDetailFieldController,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () async {

                    bool changeCheck = userEditProvider.checkUserAddress(
                      loginProvider.loginModel!.getUserAddress(),
                      loginProvider.loginModel!.getUserAddressDetail(),
                    );

                    if (changeCheck) {
                      bool successCheck =
                          await userEditProvider.loadUserAddressEdit(
                              loginProvider.loginModel!.getUserIndex());
                      if (successCheck) {
                        loginProvider.loginModel!.setUserAddress(
                            userEditProvider.userAddress,
                            userEditProvider.userAddressDetail);
                        userEditProvider.clearData();
                        loginProvider.changeCall();
                        _clearText();
                        userEditProvider.setUserDataEditCheckTrue();
                        _showToast("정상적으로 정보가 변경되었습니다.");
                      }
                    } else {
                      _showToast("변경될 정보가 없거나 동일합니다.");
                    }
                  },
                  child: Text(
                    "주소 변경",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      double.infinity,
                      50.h,
                    ),
                  ),
                ),
              ],
            ),
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

  _clearText() {
    phoneFieldController.clear();
    emailFieldController.clear();
    addressDetailFieldController.clear();
  }
}
