import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screen_widget/id_pw_find_body.dart';
import '../screen_widget/id_pw_find_foot.dart';
import '../screen_widget/id_pw_find_head.dart';

class IdPwFindScreen extends StatefulWidget {
  const IdPwFindScreen({Key? key}) : super(key: key);

  @override
  State<IdPwFindScreen> createState() => _IdPwFindScreenState();
}

class _IdPwFindScreenState extends State<IdPwFindScreen> {
  @override
  Widget build(BuildContext context) {
    print("빌드 : IdPwFindScreen");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "ID / PW 찾기",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Color(0xff020202)),
        ),
        leading: BackButton(
          color: Color(0xff707070),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0),
            child: Column(
              children: [
                const IdPwFindHead(),
                SizedBox(
                  height: 40.h,
                ),
                const IdPwFindBody(),
                SizedBox(height: 40.h,),
                const IdPwFindFoot(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










