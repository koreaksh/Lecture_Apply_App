import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';
import 'package:shinhanapp/screen/lesson_apply_screen.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:shinhanapp/screen/main_screen.dart';


import '../my_page_screen.dart';

List<GlobalKey<NavigatorState>> _teacherNavigatorKeys = [];

class TeacherNavigationScreen extends StatefulWidget {
  const TeacherNavigationScreen({Key? key}) : super(key: key);

  @override
  State<TeacherNavigationScreen> createState() => _TeacherNavigationScreenState();
}

class _TeacherNavigationScreenState extends State<TeacherNavigationScreen> {
  late NavigationIndexProvider _navigationIndexProvider;
  late LoginProvider _loginProvider;
  DateTime? backPressTime;

  late List<Widget> _widgetList;

  @override
  void initState() {
    super.initState();
    _teacherNavigatorKeys = [
      GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>()
    ];

    _widgetList = [
      MainScreen(key: _teacherNavigatorKeys[0],),
      LessonApplyScreen(key: _teacherNavigatorKeys[1],),
      MyPageScreen(key: _teacherNavigatorKeys[2],),
    ];

    _navigationIndexProvider = context.read();
    _loginProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<NavigationIndexProvider>().navigationIndex;
    print("빌드 : Navigation_screen");
    return WillPopScope(
      onWillPop: () async {
        if (await _teacherNavigatorKeys[selectedIndex].currentState!.maybePop()) {
          return false;
        }
        return _onWillPop();
      },
      child: Scaffold(
        body: _widgetList.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/navigation/navigation_main_image.png"),
                ),
                label: "메인화면",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/navigation/navigation_teacher_image.png"),
                ),
                label: "강의관리",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/navigation/navigation_my_image.png"),
                ),
                label: "My페이지",
              ),
            ],
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            selectedItemColor: Colors.black,
            currentIndex: selectedIndex,
            onTap: (int index) {
              if (index == 2) {
                if (_loginProvider.loginModel == null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                } else {
                  _navigationIndexProvider.setNavigationIndex(index);
                }
              } else {
                _navigationIndexProvider.setNavigationIndex(index);
              }
            },
          ),

      ),
    );
  }

  _onWillPop() {
    print("1");
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) > const Duration(seconds: 2)) {
      print("3");
      backPressTime = now;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xff6E6E6E),
          fontSize: 13.sp,
          toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    print("2");
    return true;
  }
}

// 네비게이션바 사용시
// bottomNavigationBar: NavigationBar(
// selectedIndex: 1,
// onDestinationSelected: (int newIndex) {},
// destinations: [
// NavigationDestination(
// selectedIcon: ImageIcon(
// AssetImage("assets/navigation/navigation_main_image.png"),
// ),
// icon: ImageIcon(
// AssetImage("assets/navigation/navigation_main_image.png"),
// color: Color(0xff707070),
// ),
// label: "메인화면"),
// NavigationDestination(icon: Icon(Icons.eco), label: "eco"),
// NavigationDestination(icon: Icon(Icons.eco), label: "eco"),
// ],
// ),
