import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/main_provider.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';

import '../screen_widget/main_page_foot.dart';
import '../screen_widget/main_page_top_body.dart';
import '../screen_widget/main_apply_text.dart';
import '../screen_widget/main_current_text.dart';
import '../screen_widget/main_text.dart';
import '../screen_widget/uijeongbu_logo_appbar.dart';
import '../screen_widget/user_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    print("빌드 : MainScreen");

    MainProvider mainProvider = context.read();
    mainProvider.loadMainData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0099FF),
        elevation: 0,
        leading: const UijeongbuLogoAppbar(),
        leadingWidth: 70,
      ),
      endDrawer: const UserDrawer(),
      body: Column(
        children: [
          MainPageTopBody(
            svgImage: Align(
              alignment: const Alignment(1.1, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  SvgPicture.asset(
                    "assets/main/main_top_image.svg",
                    width: 190.sp,
                    height: 190.sp,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          MainPageFoot(),
        ],
      ),
    );
  }
}


