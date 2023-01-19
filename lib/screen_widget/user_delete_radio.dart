import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/user_delete_provider.dart';
import 'package:shinhanapp/screen_widget/user_join_text.dart';

enum UserDeleteReason { reason1, reason2, reason3, reason4, reason5 }

class UserDeleteRadio extends StatefulWidget {
  const UserDeleteRadio({Key? key}) : super(key: key);

  @override
  State<UserDeleteRadio> createState() => _UserDeleteRadioState();
}

class _UserDeleteRadioState extends State<UserDeleteRadio> {
  UserDeleteReason _userDeleteReason = UserDeleteReason.reason1;
  late UserDeleteProvider _userDeleteProvider;

  @override
  void initState() {
    super.initState();
    _userDeleteProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserJoinText(text: "탈퇴사유"),
        SizedBox(
          height: 7.h,
        ),
        RadioListTile(
          title: Text(
            "원하는 강의가 없어요.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xff343434),
            ),
          ),
          value: UserDeleteReason.reason1,
          groupValue: _userDeleteReason,
          onChanged: (UserDeleteReason? value) {
            setState(() {
              _radioChange(value!);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: Color(0xffE2E2E2),
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        RadioListTile(
          title: Text(
            "도움이 되지가 않아요.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xff343434),
            ),
          ),
          value: UserDeleteReason.reason2,
          groupValue: _userDeleteReason,
          onChanged: (UserDeleteReason? value) {
            setState(() {
              _radioChange(value!);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: Color(0xffE2E2E2),
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        RadioListTile(
          title: Text(
            "강사가 마음에 들지 않아요.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xff343434),
            ),
          ),
          value: UserDeleteReason.reason3,
          groupValue: _userDeleteReason,
          onChanged: (UserDeleteReason? value) {
            setState(() {
              _radioChange(value!);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: Color(0xffE2E2E2),
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        RadioListTile(
          title: Text(
            "이사를 하게 되었어요.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xff343434),
            ),
          ),
          value: UserDeleteReason.reason4,
          groupValue: _userDeleteReason,
          onChanged: (UserDeleteReason? value) {
            setState(() {
              _radioChange(value!);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: Color(0xffE2E2E2),
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        RadioListTile(
          title: Text(
            "앱을 이용하기가 불편해요.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: const Color(0xff343434),
            ),
          ),
          value: UserDeleteReason.reason5,
          groupValue: _userDeleteReason,
          onChanged: (UserDeleteReason? value) {
            setState(() {
              _radioChange(value!);
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: BorderSide(
              color: Color(0xffE2E2E2),
            ),
          ),
        ),
      ],
    );
  }

  _radioChange(UserDeleteReason value) {
    _userDeleteReason = value;
    switch (value) {
      case UserDeleteReason.reason1:
        _userDeleteProvider.setDeleteReason("원하는 강의가 없어요.");
        break;
      case UserDeleteReason.reason2:
        _userDeleteProvider.setDeleteReason("도움이 되지가 않아요.");
        break;
      case UserDeleteReason.reason3:
        _userDeleteProvider.setDeleteReason("강사가 마음에 들지 않아요.");
        break;
      case UserDeleteReason.reason4:
        _userDeleteProvider.setDeleteReason("이사를 하게 되었어요.");
        break;
      case UserDeleteReason.reason5:
        _userDeleteProvider.setDeleteReason("앱을 이용하기가 불편해요.");
        break;
    }
  }
}
