import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:shinhanapp/screen/main_screen.dart';
import 'package:shinhanapp/screen/navigation_screen.dart';
import 'package:shinhanapp/screen/teacherScreen/teacher_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userIndex;
  late bool autoLoginCheck;

  @override
  void initState() {
    super.initState();

    LoginProvider loginProvider = context.read();

    _loadUserData().then((value) {
      if (autoLoginCheck) {
        loginProvider.userAutoLogin(userIndex!).then(
              (value) {
                if(loginProvider.resultStatus == "200") {
                  if(loginProvider.loginModel!.getMemType() == "일반회원") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationScreen()));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeacherNavigationScreen()));
                  }
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationScreen()));
                }
              },
            );
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavigationScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0099FF),
      body: Column(
        children: [
          SizedBox(
            height: 225.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: SvgPicture.asset("assets/splash/splash_top_image.svg",
                  width: 280.w, height: 150.h)),
          SizedBox(
            height: 258.h,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/splash/splash_bottom_image.svg",
              width: 125.w,
              height: 45.h,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    userIndex = pref.getString("shinHanAppUserIndex");
    autoLoginCheck = pref.getBool("shinHanAppUserAutoLogin") ?? false;
  }
}

