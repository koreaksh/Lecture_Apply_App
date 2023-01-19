import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

import '../provider/login_provider.dart';
import '../provider/my_page_provider.dart';
import '../repository/apply_change_repository.dart';

class ApplyCancelDialog extends StatelessWidget {
  final int listItemIndex;

  const ApplyCancelDialog({
    Key? key,
    required this.listItemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPageProvider myPageProvider = context.read();
    LoginProvider loginProvider = context.read();
    ApplyChangeRepository applyChangeRepository = ApplyChangeRepository();

    return Dialog(
      child: Container(
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              "수강을 취소 하시겠습니까?",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff020202),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      80.w,
                      30.h,
                    ),
                    backgroundColor: const Color(0xffC1C1C1),
                  ),
                  child: Text(
                    "닫기",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff343434),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    bool check = await applyChangeRepository.applyChange(
                        loginProvider.loginModel!.getUserIndex(),
                        myPageProvider
                            .getModelList()![listItemIndex]
                            .getDetailIndex(),
                        "취소");

                    if(check) {
                      showToast("수강 취소가 완료되었습니다.", ToastGravity.BOTTOM);
                      myPageProvider.loadMyPage(loginProvider.loginModel!.getUserIndex());
                      Navigator.pop(context);
                    } else {
                      showToast("잠시 후 다시 시도해 주세요.", ToastGravity.BOTTOM);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      80.w,
                      30.h,
                    ),
                    backgroundColor: const Color(0xff343434),
                  ),
                  child: Text(
                    "확인",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}