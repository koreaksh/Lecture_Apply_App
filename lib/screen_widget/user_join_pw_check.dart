import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/pw_check_provider.dart';

class UserJoinPwCheck extends StatelessWidget {
  const UserJoinPwCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : user_join_pw_check");
    if(!context.read<PwCheckProvider>().checkPw()) return Text(context.watch<PwCheckProvider>().pwText, style: TextStyle(color: Colors.red),);
    return Text(context.watch<PwCheckProvider>().pwText, style: TextStyle(color: Colors.green),);
  }
}
