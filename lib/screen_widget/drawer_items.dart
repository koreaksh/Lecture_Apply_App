import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consttants.dart';
import '../screen/login_screen.dart';
import 'logout_dialog.dart';

class DrawerItems extends StatelessWidget {
  final String text;
  final Icon iconItem;

  const DrawerItems({
    Key? key,
    required this.text,
    required this.iconItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconItem,
      title: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: black02,
            fontSize: 14.sp),
      ),
      onTap: () {
        if (text == "로그인") {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else if (text == "로그아웃") {
          showDialog(
              context: context,
              builder: (_) {
                return const LogoutDialog();
              });
        }
      },
    );
  }
}
