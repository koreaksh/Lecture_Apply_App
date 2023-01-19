import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:flutter/services.dart';

import '../consttants.dart';
import '../screen/user_pw_edit_screen.dart';
import 'drawer_items.dart';

class NavigationMenuItems extends StatelessWidget {
  const NavigationMenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationIndexProvider navigationIndexProvider = context.read();
    LoginProvider loginProvider = context.read();

    print("빌드 : NavigationMenuItems");
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(
              Icons.book,
              color: black02,
            ),
            title: Text(
              "강의목록",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: black02,
                  fontSize: 14.sp),
            ),
            onTap: () {
              Navigator.pop(context);
              navigationIndexProvider.setNavigationIndex(1);
            },
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(
              Icons.menu_book_sharp,
              color: black02,
            ),
            title: Text(
              "나의 강의현황",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: black02,
                  fontSize: 14.sp),
            ),
            onTap: () {
              if (loginProvider.loginModel == null) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen(),),);
              } else {
                Navigator.pop(context);
                navigationIndexProvider.setNavigationIndex(2);
              }
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        // Container(
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: const Icon(
        //       Icons.account_circle_outlined,
        //       color: drawerIconColor,
        //     ),
        //     title: Text(
        //       "회원정보 변경",
        //       style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: drawerIconColor,
        //           fontSize: 14.sp),
        //     ),
        //     onTap: () {
        //       if (loginProvider.loginModel == null) {
        //         etcNavigationStateProvider.offNavigation();
        //         Navigator.pop(context);
        //         Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => LoginScreen()))
        //             .then((value) {
        //           etcNavigationStateProvider.onNavigation();
        //         });
        //       } else {
        //         etcNavigationStateProvider.offNavigation();
        //         Navigator.pop(context);
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => UserEditScreen())).then((value) {
        //           etcNavigationStateProvider.onNavigation();
        //           userEditProvider.clearData();
        //           if (userEditProvider.userDataEditCheck) {
        //             navigationIndexProvider.setNavigationIndex(0);
        //             userEditProvider.setUserDataEditCheckFalse();
        //           }
        //         });
        //       }
        //     },
        //   ),
        // ),
        // SizedBox(
        //   height: 3.h,
        // ),
        Container(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(
              Icons.lock_outline,
              color: black02,
            ),
            title: Text(
              "비밀번호 변경",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: black02,
                  fontSize: 14.sp),
            ),
            onTap: () {
              if (loginProvider.loginModel == null) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              } else {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserPwEditScreen()));
              }
            },
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          color: Colors.white,
          child: loginProvider.loginModel == null
              ? const DrawerItems(
                  text: "로그인",
                  iconItem: Icon(
                    Icons.exit_to_app_outlined,
                    color: black02,
                  ),
                )
              : const DrawerItems(
                  text: "로그아웃",
                  iconItem: Icon(
                    Icons.exit_to_app_outlined,
                    color: black02,
                  ),
                ),
        ),
      ],
    );
  }
}
