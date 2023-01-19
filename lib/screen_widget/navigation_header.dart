import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.read();
    print("빌드 : NavigationHeader");
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 10.h, top: 10.h),
            child: Icon(
              Icons.account_circle,
              color: Colors.grey[350],
              size: 25.h,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Color(0xff020202), fontSize: 12.sp),
              children: [
                TextSpan(text: loginProvider.loginModel?.getUserName() ?? "사용자", style: TextStyle(color: Color(0xff0099FF))),
                TextSpan(text: "님,안녕하세요."),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: SvgPicture.asset("assets/drawer/cancel_button_image.svg", color: Color(0xff707070),)),
          )
        ],
      ),
    );
  }
}