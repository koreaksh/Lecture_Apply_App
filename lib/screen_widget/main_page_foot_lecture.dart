import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/main_provider.dart';

import 'main_page_foot.dart';
import 'main_page_foot_lecture_item.dart';

class MainPageFootLecture extends StatelessWidget {
  const MainPageFootLecture({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    print("빌드 : MainPageFootLecture");
    final mainProvider = context.select((MainProvider e) => e.lectureLatestModel);

    return Column(
      children: [
        MainPageFootLectureItem(title: mainProvider?[0].title ?? "제목", admin: mainProvider?[0].admin ?? "강사", date:  mainProvider?[0].date ?? "날짜"),
        SizedBox(height: 7.h,),
        MainPageFootLectureItem(title: mainProvider?[1].title ?? "제목", admin: mainProvider?[1].admin ?? "강사", date:  mainProvider?[1].date ?? "날짜"),
      ],
    );
  }
}