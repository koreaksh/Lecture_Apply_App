import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/model/lecture_list_model.dart';
import 'package:shinhanapp/provider/login_provider.dart';
import 'package:shinhanapp/screen/lecture_detail_screen.dart';
import 'package:shinhanapp/screen/teacherScreen/teacher_lecture_setting_screen.dart';

import 'lecture_text_tool.dart';
import 'lesson_rec_check.dart';

class LessonListItem extends StatelessWidget {
  final LectureListModel lecture;

  const LessonListItem({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : LessonListItem");

    LoginProvider loginProvider = context.read();

    return InkWell(
      onTap: () {
        if(!loginProvider.typeCheck()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeacherLectureSettingScreen(

              ),
            ),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LectureDetailScreen(
              index: lecture.getIndex(),
            ),
          ),
        );
      },
      child: Container(
        width: 360.w,
        height: 237.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Container(
                  height: 90.sp,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.sp,
                        height: 90.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          image: DecorationImage(
                              image: NetworkImage(lecture.getImage()),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 195.w,
                            height: 60.h,
                            child: Text(
                              lecture.getTitle(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                letterSpacing: 0.25.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.r),
                                    color: Colors.white,
                                    border: Border.all(color: Color(0xff343434)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      lecture.getPay(),
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Color(0xff343434),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 7.w,),
                                LessonRecCheck(
                                    text: lecture.getComplete(),
                                    color: lecture.getComplete() == "모집완료"
                                        ? const Color(0xff37B700)
                                        : const Color(0xffFF9100)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.5.h,
              ),
              Divider(
                color: Color(0xffE2E2E2),
                thickness: 1.sp,
              ),
              Spacer(),
              Text(
                lecture.getDescription(),
                style: TextStyle(
                    fontSize: 12.sp, color: Color(0xff020202), height: 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Spacer(),
              Row(
                children: [
                  const LectureTextTool(text: "담당자"),
                  SizedBox(
                    width: 29.w,
                  ),
                  Text(
                    lecture.getAdmin(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff020202),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  const LectureTextTool(
                    text: "강의기간",
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  Text(
                    "${lecture.getStartDate().substring(0, 10)} - ${lecture.getEndDate().substring(0, 10)}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff020202),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
