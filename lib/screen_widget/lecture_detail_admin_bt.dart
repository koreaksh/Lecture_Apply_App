import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/lecture_info_provider.dart';
import 'package:shinhanapp/screen_widget/show_pdf.dart';
import 'package:url_launcher/url_launcher.dart';

class LectureDetailAdminBt extends StatefulWidget {
  const LectureDetailAdminBt({
    Key? key,
  }) : super(key: key);

  @override
  State<LectureDetailAdminBt> createState() => _LectureDetailAdminBtState();
}

class _LectureDetailAdminBtState extends State<LectureDetailAdminBt> {
  late LectureInfoProvider _lectureInfoProvider;

  @override
  void initState() {
    super.initState();
    _lectureInfoProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showPdf(_lectureInfoProvider.lectureInfo!.getAdminAboutLink());
      },
      child: Text(
        "강사이력",
        style: TextStyle(
          fontSize: 10.sp,
          letterSpacing: -0.25.sp,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Color(0xff343434),
        minimumSize: Size(60.w, 20.h),
      ),
    );
  }


}






