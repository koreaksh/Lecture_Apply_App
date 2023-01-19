import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'main_current_text.dart';
import 'main_page_body_bottom_box.dart';
import 'main_page_body_top_box.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainPageBodyTopBox(),
        SizedBox(height: 10.h,),
        MainPageBodyBottomBox(),
      ],
    );
  }
}



