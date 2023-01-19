import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';
import 'package:shinhanapp/screen_widget/user_delete_dialog.dart';

class UserDeleteBt extends StatelessWidget {
  const UserDeleteBt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.read();
    UserDeleteProvider userDeleteProvider = context.read();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if(userDeleteProvider.pwCheck()) {
            showToast("비밀번호를 입력해 주세요.", ToastGravity.BOTTOM);
            return;
          }
          showDialog(
            context: context,
            builder: (_) {
              return UserDeleteDialog();
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          elevation: 0,
          primary: Color(0xffC1C1C1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.r),
          ),
        ),
        child: Text(
          "회원탈퇴",
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(0xff343434),
            fontWeight: FontWeight.bold,
            letterSpacing: -0.2.sp,
          ),
        ),
      ),
    );
  }


}


