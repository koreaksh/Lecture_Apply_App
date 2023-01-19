import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';
import 'package:shinhanapp/provider/id_check_provider.dart';
import 'package:shinhanapp/provider/join_address_provider.dart';
import 'package:shinhanapp/provider/join_condition_provider.dart';
import 'package:shinhanapp/provider/join_phone_number_provider.dart';
import 'package:shinhanapp/provider/join_provider.dart';
import 'package:shinhanapp/provider/join_pw_obs_check_provider.dart';
import 'package:shinhanapp/provider/lecture_apply_provider.dart';
import 'package:shinhanapp/provider/lecture_info_provider.dart';
import 'package:shinhanapp/provider/lecture_list_provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/main_provider.dart';
import 'package:shinhanapp/provider/my_page_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';
import 'package:shinhanapp/provider/pw_check_provider.dart';
import 'package:shinhanapp/provider/user_attendance_provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/provider/user_edit_provider.dart';
import 'package:shinhanapp/provider/user_edit_pw_check_provider.dart';
import 'package:shinhanapp/provider/user_pw_edit_provider.dart';
import 'package:shinhanapp/screen/splash_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (e) => IdCheckProvider()),
        ChangeNotifierProvider(create: (e) => PwCheckProvider()),
        ChangeNotifierProvider(create: (e) => JoinPwObsCheckProvider()),
        ChangeNotifierProvider(create: (e) => JoinPhoneNumberProvider()),
        ChangeNotifierProvider(create: (e) => JoinAddressProvider()),
        ChangeNotifierProvider(create: (e) => JoinProvider()),
        ChangeNotifierProvider(create: (e) => LoginProvider()),
        ChangeNotifierProvider(create: (e) => NavigationIndexProvider()),
        ChangeNotifierProvider(create: (e) => LectureListProvider()),
        ChangeNotifierProvider(create: (e) => LectureInfoProvider()),
        ChangeNotifierProvider(create: (e) => LectureApplyProvider()),
        ChangeNotifierProvider(create: (e) => MyPageProvider()),
        ChangeNotifierProvider(create: (e) => MainProvider()),
        ChangeNotifierProvider(create: (e) => UserEditProvider()),
        ChangeNotifierProvider(create: (e) => UserPwEditProvider()),
        ChangeNotifierProvider(create: (e) => UserDeleteProvider()),
        ChangeNotifierProvider(create: (e) => UserEditPwCheckProvider()),
        ChangeNotifierProvider(create: (e) => JoinConditionProvider()),
        ChangeNotifierProvider(create: (e) => IdPwFindProvider()),
        ChangeNotifierProvider(create: (e) => UserAttendanceProvider()),
      ],
      child: const ShinHanApp(),
    ),
  );
}

class ShinHanApp extends StatelessWidget {
  const ShinHanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "SHINHAN",
          home: SplashScreen(),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
