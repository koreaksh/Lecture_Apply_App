import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/consttants.dart';
import 'package:shinhanapp/provider/navigation_index_provider.dart';

import 'navigation_header.dart';
import 'navigation_menu_items.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : UserDrawer");

    return Drawer(
      child: Container(
        color: Color(0xffEFF2F3),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NavigationHeader(),
              NavigationMenuItems(),
            ],
          ),
        ),
      ),
    );
  }


}

