import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/screen_widget/my_page_studying_body.dart';

import '../provider/my_page_provider.dart';
import 'my_page_apply_body.dart';
import 'my_page_complete_body.dart';

class MyPageLectureListBody extends StatelessWidget {
  const MyPageLectureListBody({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("빌드 : MyPageLectureListBody");
    MyPageProvider myPageProvider = context.read();


    switch(myPageProvider.choiceIndex) {
      case "0" : return MyPageApplyBody();
      case "1" : return MyPageStudyingBody();
      case "2" : return MyPageCompleteBody();
      default : return Text("에러페이지");
    }

  }
}