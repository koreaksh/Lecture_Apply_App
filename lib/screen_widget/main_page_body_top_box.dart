import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/main_provider.dart';

import 'main_current_text.dart';

class MainPageBodyTopBox extends StatelessWidget {
  const MainPageBodyTopBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.select((MainProvider e) => e.mainLectureApplyModel);

    return Container(
      height: 95.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff343434).withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 30.w, top: 10.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "강의신청 현황",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff020202),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainCurrentText(
                        text: "신청진행",
                        count: mainProvider?.applyStart ?? "0",
                        color: Color(0xffFF9100),
                      ),
                      SizedBox(
                          width: 120.w,
                          child: Divider(
                            color: Color(0xffE2E2E2),
                            thickness: 1,
                            height: 3.h,
                          )),
                      MainCurrentText(
                        text: "신청완료",
                        count: mainProvider?.applyEnd ?? "0",
                        color: Color(0xff37B700),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/main/main_book_image.svg",
              width: 66.sp,
              height: 50.sp,
            ),
          ],
        ),
      ),
    );
  }
}