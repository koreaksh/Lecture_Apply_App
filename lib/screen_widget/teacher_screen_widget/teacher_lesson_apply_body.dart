import 'package:flutter/material.dart';
import 'package:shinhanapp/screen_widget/teacher_screen_widget/teacher_lesson_apply_body_bottom.dart';
import 'package:shinhanapp/screen_widget/teacher_screen_widget/teacher_lesson_apply_body_top.dart';

class TeacherLessonApplyBody extends StatelessWidget {
  const TeacherLessonApplyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TeacherLessonApplyBodyTop(),
        TeacherLessonApplyBodyBottom(),
      ],
    );
  }
}