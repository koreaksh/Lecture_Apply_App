import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/my_page_lecture_list_head.dart';

import '../provider/login_provider.dart';
import '../provider/my_page_provider.dart';
import 'main_page_top_body.dart';
import 'my_page_lecture_list_items.dart';

class MyPageCompleteBody extends StatelessWidget {
  const MyPageCompleteBody({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("빌드 : MyPageCompleteBody");
    LoginProvider loginProvider = context.read();

    return Consumer<MyPageProvider>(
      builder: (context, provider, widget) {
        return Stack(
          children: [
            const MyPageLectureListHead(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: -0.25.sp,
                      ),
                      children: [
                        TextSpan(
                          text: loginProvider.loginModel!.getUserName(),
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "님은\n"),
                        TextSpan(
                          text: "${provider.completeCount}건",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "의 강의를 완료 하였습니다."),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            MyPageLectureListItems(index: index,),
                            SizedBox(height: 20.h,),
                          ],
                        );
                      },
                      itemCount: int.tryParse(provider.completeCount),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}