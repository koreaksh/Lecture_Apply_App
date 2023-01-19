import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/screen_widget/user_delete_pw.dart';
import 'package:shinhanapp/screen_widget/appbar_black_close.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

import '../screen_widget/user_delete_bt.dart';
import '../screen_widget/user_delete_mg.dart';
import '../screen_widget/user_delete_radio.dart';

class UserDeleteScreen extends StatelessWidget {
  const UserDeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDeleteProvider userDeleteProvider = context.read();
    userDeleteProvider.clear();

    print("빌드 : UserDeleteScreen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const UijeongbuLogoAppbar(
          blackLogo: true,
        ),
        actions: const [
          AppbarBlackClose(),
        ],
        elevation: 0,
        title: Text(
          "회원탈퇴",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
          child: Column(
            children: [
              UserDeleteMg(),
              SizedBox(
                height: 29.h,
              ),
              UserDeleteRadio(),
              SizedBox(
                height: 39.h,
              ),
              UserDeletePw(),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: UserDeleteBt(),
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}


