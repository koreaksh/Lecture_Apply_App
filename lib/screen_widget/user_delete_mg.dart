import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDeleteMg extends StatelessWidget {
  const UserDeleteMg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.sp,
          letterSpacing: -0.25.sp,
          color: Color(0xff020202),
        ),
        children: [
          TextSpan(text: "사용하고 계신 아이디를 "),
          TextSpan(
            text: "탈퇴하시면 본인과 타인 모두 재사용 및 복구가 불가",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: "하오니 신중하게 선택해 주세요."),
        ],
      ),
    );
  }
}