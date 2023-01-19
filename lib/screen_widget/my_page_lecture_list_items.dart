import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/screen_widget/show_map.dart';

import '../provider/my_page_provider.dart';
import 'lesson_rec_check.dart';
import 'my_page_lecture_list_items_bt1.dart';
import 'my_page_lecture_list_items_bt2.dart';
import 'my_page_lecture_list_items_text.dart';
import 'my_page_lecture_list_items_value_text.dart';

class MyPageLectureListItems extends StatelessWidget {
  const MyPageLectureListItems({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    print(("빌드 : MyPageLectureListItems"));
    MyPageProvider myPageProvider = context.read();

    return Container(
      width: double.infinity,
      height: 386.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: myPageProvider.loadColor(index),
          width: 2.sp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  myPageProvider.getModelList()![index].getTitle(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Color(0xff020202),
                    letterSpacing: -0.25.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              LessonRecCheck(
                text: myPageProvider.getModelList()![index].getLectureState(),
                color: myPageProvider.loadColor(index),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              SizedBox(width: 15.w),
              const MyPageLectureListItemsText(text: "강사"),
              SizedBox(width: 10.w),
              MyPageLectureListItemsValueText(
                  text: myPageProvider.getModelList()![index].getAdmin()),
              const SizedBox(width: 20),
              const MyPageLectureListItemsText(text: "교육비"),
              SizedBox(
                width: 10.w,
              ),
              MyPageLectureListItemsValueText(
                  text: myPageProvider.getModelList()![index].getPay()),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              SizedBox(width: 15.w),
              MyPageLectureListItemsText(text: "기간"),
              SizedBox(width: 10.w),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff020202),
                  ),
                  children: [
                    TextSpan(
                      text: myPageProvider.loadDate(index),
                    ),
                    TextSpan(
                      text: "  |  ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC1C1C1),
                      ),
                    ),
                    TextSpan(
                      text:
                          myPageProvider.getModelList()![index].getStartTime(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 15.w),
              const MyPageLectureListItemsText(text: "장소"),
              SizedBox(width: 10.w),
              MyPageLectureListItemsValueText(text: myPageProvider.loadLocation(index)),
            ],
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 175.h,
            child: ShowMap(
              lat: myPageProvider.getModelList()![index].getLat(),
              lng: myPageProvider.getModelList()![index].getLng(),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          myPageProvider.getModelList()![index].getLectureStateBool()
              ? MyPageLectureListItemsBt2(index: index)
              : MyPageLectureListItemsBt1(index: index,),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}








