import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';
import 'package:shinhanapp/screen_widget/pw_find_dialog.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

import 'id_find_dialog.dart';

class IdPwFindFoot extends StatelessWidget {
  const IdPwFindFoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IdPwFindProvider idPwFindProvider = context.read();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: () async {
          if (!idPwFindProvider.textFieldCheck()) {
            showToast("정보 입력이 필요합니다.", ToastGravity.BOTTOM);
            return;
          }
          bool result = await idPwFindProvider.find();
          if (result) {
            if (idPwFindProvider.idPwChoice) {
              showDialog(
                context: context,
                builder: (_) {
                  return IdFindDialog();
                },
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return PwFindDialog();
                },
              ).then((value) => Navigator.pop(context));
            }
          } else {
            showToast(idPwFindProvider.failMg, ToastGravity.BOTTOM);
          }
        },
        child: Text(
          "찾기",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            45.h,
          ),
          primary: const Color(0xff0099FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.r),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}


