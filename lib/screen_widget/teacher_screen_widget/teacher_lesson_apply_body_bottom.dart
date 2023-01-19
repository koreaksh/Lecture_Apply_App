import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/my_page_provider.dart';
import '../lesson_list_item.dart';

class TeacherLessonApplyBodyBottom extends StatelessWidget {
  const TeacherLessonApplyBodyBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPageProvider myPageProvider = context.read();

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              LessonListItem(lecture: myPageProvider.getTeacherModelList()![index]),
              SizedBox(height: 8.h),
            ],
          );
        },
        itemCount: int.parse(myPageProvider.getTeacherCount()),
      ),
    );
  }
}