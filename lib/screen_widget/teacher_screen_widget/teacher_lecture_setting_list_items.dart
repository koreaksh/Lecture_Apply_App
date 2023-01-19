import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consttants.dart';

class TeacherLectureSettingListItems extends StatelessWidget {
  final int itemIndex;

  const TeacherLectureSettingListItems({Key? key, required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: grayE2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 32,
            child: Container(
              color: Colors.green,
              child: Checkbox(value: false, onChanged: (bool? value) {  },),
            ),
          ),
          Expanded(
            flex: 48,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 80,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 112,
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 48,
            child: Container(
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
