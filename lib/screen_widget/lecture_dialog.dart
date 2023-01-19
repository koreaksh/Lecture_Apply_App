import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/lecture_apply_provider.dart';
import 'package:shinhanapp/provider/lecture_info_provider.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/screen/lecture_complete_screen.dart';
import 'package:shinhanapp/screen_widget/show_toast.dart';

class LectureDialog extends StatefulWidget {
  final int lectureIndex;
  final BuildContext detailScreenContext;

  const LectureDialog(
      {Key? key, required this.lectureIndex, required this.detailScreenContext})
      : super(key: key);

  @override
  State<LectureDialog> createState() => _LectureDialogState();
}

class _LectureDialogState extends State<LectureDialog> {
  String value = "강의 날짜를 선택해 주세요.";
  int index = -1;
  late LectureInfoProvider lectureInfoProvider;
  late LoginProvider loginProvider;
  late LectureApplyProvider lectureApplyProvider;

  @override
  void dispose() {
    super.dispose();
    lectureApplyProvider.clear();
  }

  @override
  void initState() {
    super.initState();
    lectureInfoProvider = context.read();
    loginProvider = context.read();
    lectureApplyProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : LectureDialog");

    return Container(
      height: 300.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "날짜 선택",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff020202),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                menuMaxHeight: 204.h,
                isExpanded: true,
                value: value,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xff020202),
                ),
                items: lectureInfoProvider.textList.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Container(
                      child: Text(e),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffE2E2E2), width: 1.sp),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (var value) {
                  setState(
                    () {
                      this.value = value.toString();
                      index = lectureInfoProvider.textList.indexOf(value) - 1;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "장소 입력",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff020202),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: TextFormField(
                readOnly: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: BorderSide(color: Color(0xffE2E2E2)),
                  ),
                  hintText:
                      context.select((LectureApplyProvider e) => e.address),
                  hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: lectureApplyProvider.getAddressColor()),
                  contentPadding:
                      EdgeInsets.only(left: 10.w, top: 16.h, bottom: 17.h),
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5.sp, 5.w, 5.sp),
                    child: OutlinedButton(
                      onPressed: () async {
                        lectureApplyProvider.loadAddressFindScreen(context);
                      },
                      child: Text(
                        "검색",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0099FF)),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
                        side: BorderSide(color: Color(0xff0099FF)),
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(
                          color: const Color(0xff0099FF), width: 2.w)),
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: TextFormField(
                style: TextStyle(fontSize: 13.sp),
                onChanged: (value) {
                  lectureApplyProvider.setAddressDetail(value);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: BorderSide(color: Color(0xffE2E2E2)),
                  ),
                  hintText: "상세 위치를 입력해 주세요.",
                  hintStyle:
                      TextStyle(fontSize: 12.sp, color: Color(0xffC1C1C1)),
                  contentPadding:
                      EdgeInsets.only(left: 10.w, top: 6.h, bottom: 10.h),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(
                          color: const Color(0xff0099FF), width: 2.w)),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff707070),
                    letterSpacing: -0.25.w),
                children: [
                  TextSpan(text: "원하는 강의 장소를 직접 입력해 주세요."),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "취소",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff343434),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      100.w,
                      30.h,
                    ),
                    primary: Color(0xffC1C1C1),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (index == -1) return;
                    // print(
                    //     "신청완료 : 강의상세인덱스 ${lectureInfoProvider.lectureDetailInfo![index].getLectureDetailIndex()} 강의인덱스 ${widget.lectureIndex} 회원인덱스 ${loginProvider.loginModel!.getUserIndex()}");
                    // Navigator.pop(context);
                    // Navigator.push(
                    //     widget.detailScreenContext,
                    //     MaterialPageRoute(
                    //         builder: (context) => LectureCompleteScreen()));

                    if (!lectureApplyProvider.checkField()) {
                      showToast("장소를 입력해 주세요.", ToastGravity.CENTER);
                      return;
                    }

                    if (!lectureApplyProvider.address.contains("경기 의정부시")) {
                      showToast("강의 장소는 『의정부시』 여야 합니다.", ToastGravity.CENTER);
                      return;
                    }

                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return Dialog(
                          child: Container(
                            height: 100.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "신청하시겠습니까?",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff020202),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "취소",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff343434),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(
                                          80.w,
                                          30.h,
                                        ),
                                        primary: Color(0xffC1C1C1),
                                      ),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await lectureApplyProvider
                                            .loadLectureApply(
                                          loginProvider.loginModel!
                                              .getUserIndex(),
                                          widget.lectureIndex.toString(),
                                          lectureInfoProvider
                                              .lectureDetailInfo![index]
                                              .getLectureDetailIndex()
                                              .toString(),
                                        );

                                        if (!lectureApplyProvider
                                            .checkSuccess()) {
                                          return;
                                        }

                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.push(
                                            widget.detailScreenContext,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LectureCompleteScreen()));
                                      },
                                      child: Text(
                                        "신청",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(
                                          80.w,
                                          30.h,
                                        ),
                                        primary: Color(0xff0099FF),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "신청",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      100.w,
                      30.h,
                    ),
                    primary: Color(0xff0099FF),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
