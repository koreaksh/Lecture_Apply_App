import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/join_condition_provider.dart';

class JoinConditionHead extends StatefulWidget {
  final bool require;
  final String title;

  const JoinConditionHead({
    Key? key,
    required this.title,
    this.require = false,
  }) : super(key: key);

  @override
  State<JoinConditionHead> createState() => _JoinConditionHeadState();
}

class _JoinConditionHeadState extends State<JoinConditionHead> {
  late JoinConditionProvider _joinConditionProvider;

  @override
  void initState() {
    super.initState();
    _joinConditionProvider = context.read();
  }

  @override
  void dispose() {
    super.dispose();
    _joinConditionProvider.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            _joinConditionProvider.changeConditionCheck();
            setState(() {

            });
          },
          icon: Icon(
            Icons.check_circle,
            color: _joinConditionProvider.conditionCheck == true ? Color(0xff0099FF) : Color(0xffC1C1C1),

            size: 23.sp,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff020202),
            fontWeight: FontWeight.bold,
            letterSpacing: -0.25.sp,
          ),
        ),
        SizedBox(
          width: 2.sp,
        ),
        widget.require == true
            ? Text(
          "(필수)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: Color(0xff0099FF),
            letterSpacing: -0.25.sp,
          ),
        )
            : SizedBox(),
      ],
    );
  }
}