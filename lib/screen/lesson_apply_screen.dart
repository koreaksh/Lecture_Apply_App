import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/lecture_list_provider.dart';
import 'package:shinhanapp/repository/lecture_search_repository.dart';
import 'package:shinhanapp/screen_widget/uijeongbu_logo_appbar.dart';

import '../screen_widget/lesson_list_item.dart';
import '../screen_widget/user_drawer.dart';

class LessonApplyScreen extends StatelessWidget {
  LessonApplyScreen({Key? key}) : super(key: key);
  late LectureListProvider _lectureListProvider;

  @override
  Widget build(BuildContext context) {
    _lectureListProvider = context.read();
    _lectureListProvider.loadLectureList();
    print("빌드 : LessonApplyScreen");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "강의목록",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff020202),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff707070),
        ),
        elevation: 0,
        leading: const UijeongbuLogoAppbar(blackLogo: true,),
        leadingWidth: 70,
      ),
      endDrawer: UserDrawer(),
      body: Column(
          children: [
            Container(
              height: 215.h,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff0099FF),
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: 162.w,
                      height: 162.h,
                      child: SvgPicture.asset(
                        "assets/lesson/lesson_people_image.svg",
                      ),
                    ),
                    top: 10.h,
                    left: 11.w,
                  ),
                  Positioned(
                    child: Text(
                      "내 삶을 바꾸는 교육",
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: -0.25.sp,
                        color: Colors.white,
                      ),
                    ),
                    top: 43.h,
                    right: 27.w,
                  ),
                  Positioned(
                    child: SizedBox(
                      width: 145.w,
                      height: 62.h,
                      child: SvgPicture.asset(
                        "assets/main/main_text.svg",
                      ),
                    ),
                    top: 68.h,
                    right: 20.w,
                  ),
                  Positioned(
                    top: 150.h,
                    left: 20.w,
                    child: SizedBox(
                      width: 320.w,
                      height: 50.h,
                      child: TextFormField(
                        onChanged: (text) {
                          _lectureListProvider.setText(text);
                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 16.h,
                            bottom: 17.h,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80.r),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 15.w),
                            child: InkWell(
                              onTap: () {
                                _lectureListProvider.search();
                              },
                              child: Icon(
                                Icons.search,
                                color: Color(0xff0099FF),
                                size: 26.sp,
                              ),
                            ),
                          ),
                          hintText: "검색어를 입력해주세요",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffC1C1C1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80.r),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           Consumer<LectureListProvider>(
                    builder: (context, provider, widget) {
                  if (provider.lectureList != null &&
                      provider.lectureList!.isNotEmpty) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => _lectureListProvider.loadLectureList(),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                LessonListItem(
                                    lecture: provider.lectureList![index]),
                                index != provider.lectureList!.length - 1
                                    ? SizedBox(
                                        height: 10.h,
                                      )
                                    : SizedBox(
                                        height: 50.h,
                                      ),
                              ],
                            );
                          },
                          itemCount: provider.lectureList!.length,
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                      height: 356.2.h,
                      child: const Center(
                        child: Text("강의 정보가 존재하지 않습니다."),
                      ));
                }),
                // SizedBox(
                //   width: double.infinity,
                //   height: 356.2.h,
                //   child: ListView.builder(
                //     itemBuilder: (context, index) {
                //       return Column(
                //         children: [
                //           LessonListItem(),
                //           SizedBox(height: 10.h,),
                //         ],
                //       );
                //     },
                //     itemCount: 12,
                //   ),
                // ),

          ],
        ),
    );
  }
}
