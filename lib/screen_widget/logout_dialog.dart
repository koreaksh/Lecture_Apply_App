import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:shinhanapp/screen/navigation_screen.dart';

import '../provider/login_provider.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : LogoutDialog");
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
              "로그아웃 하시겠습니까?",
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
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    navigationIndexProvider.clearNavigation();
                    loginProvider.userLogout();
                    _autoLoginClear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    "로그아웃",
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
