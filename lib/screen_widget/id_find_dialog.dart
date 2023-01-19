import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

import '../provider/IdPwFindProvider.dart';

class IdFindDialog extends StatelessWidget {
  const IdFindDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IdPwFindProvider idPwFindProvider = context.read();
    return Dialog(
      child: Container(
        height: 80.h,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const UserJoinText(text: "입력한 정보와 일치하는 아이디입니다."),
            Spacer(),
            Text(idPwFindProvider.findSuccessId),
            Spacer(),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}