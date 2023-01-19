import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

import '../screen/navigation_screen.dart';

class UserDeleteDialog extends StatelessWidget {
  const UserDeleteDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDeleteProvider userDeleteProvider = context.read();
    LoginProvider loginProvider = context.read();
    NavigationIndexProvider navigationIndexProvider = context.read();

    return Dialog(
      child: Container(
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              "정말로 탈퇴하시겠습니까?",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff020202),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
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
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    userDeleteProvider
                        .userDelete(loginProvider.loginModel!.getUserIndex())
                        .then(
                          (value) {
                            if(userDeleteProvider.successCheck) {
                              navigationIndexProvider.clearNavigation();
                              loginProvider.userLogout();
                              userDeleteProvider.clear();
                              _autoLoginClear();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavigationScreen(),
                                  ),
                                      (route) => false);
                              showToast("탈퇴 처리가 완료되었습니다.",ToastGravity.BOTTOM);
                            } else {
                              Navigator.pop(context);
                              showToast("잘못된 비밀번호 입니다.", ToastGravity.BOTTOM);
                            }
                          },
                        );
                  },
                  child: Text(
                    "탈퇴",
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
  Future<void> _autoLoginClear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}