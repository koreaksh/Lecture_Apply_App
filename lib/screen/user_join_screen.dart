import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/join_address_provider.dart';
import 'package:shinhanapp/provider/join_condition_provider.dart';
import 'package:shinhanapp/provider/join_phone_number_provider.dart';
import 'package:shinhanapp/provider/join_provider.dart';
import 'package:shinhanapp/provider/join_pw_obs_check_provider.dart';
import 'package:shinhanapp/provider/pw_check_provider.dart';
import 'package:shinhanapp/repository/id_check_repository.dart';
import 'package:shinhanapp/repository/join_repository.dart';
import 'package:shinhanapp/screen/login_screen.dart';
import 'package:shinhanapp/screen_widget/user_join_id_check.dart';
import 'package:shinhanapp/screen_widget/user_join_pw_check.dart';

import '../provider/id_check_provider.dart';
import '../screen_widget/user_join_pw_box.dart';
import '../screen_widget/user_join_text.dart';

class UserJoinScreen extends StatefulWidget {
  const UserJoinScreen({Key? key}) : super(key: key);

  @override
  State<UserJoinScreen> createState() => _UserJoinScreenState();
}

class _UserJoinScreenState extends State<UserJoinScreen> {
  String _email = "";
  String _name = "";

  late IdCheckProvider _idCheckProvider;
  final FocusNode _idFocusNode = FocusNode();
  late PwCheckProvider _pwCheckProvider;
  late JoinPwObsCheckProvider _joinPwObsCheckProvider;
  late JoinPhoneNumberProvider _joinPhoneNumberProvider;
  late JoinAddressProvider _joinAddressProvider;
  late JoinProvider _joinProvider;
  TextEditingController _addressDetailController = TextEditingController();
  late JoinConditionProvider _joinConditionProvider;

  @override
  void initState() {
    super.initState();
    _idCheckProvider = context.read();
    _pwCheckProvider = context.read();
    _joinPwObsCheckProvider = context.read();
    _joinPhoneNumberProvider = context.read();
    _joinAddressProvider = context.read();
    _joinProvider = context.read();
    _joinConditionProvider = context.read();
  }

  @override
  void dispose() {
    _idFocusNode.dispose();
    _idCheckProvider.falseChecked();
    _pwCheckProvider.clearCheckText();
    _pwCheckProvider.clearPw();
    _pwCheckProvider.clearPwCheck();
    _idCheckProvider.clearId();
    _joinPwObsCheckProvider.clearObs();
    _joinPhoneNumberProvider.clearPhoneNumber();
    _joinAddressProvider.clearAddress();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("?????? : user_join_screen ");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            _joinConditionProvider.typeCheck == true ? "??????????????????" : "??????????????????",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Color(0xff020202)),
          ),
          leading: BackButton(
            color: Color(0xff707070),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 49.h, 20.w, 40.h),
                child: Container(
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          UserJoinText(
                            text: "?????????",
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const UserJoinIdCheck(),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^[a-zA-Z][a-zA-Z0-9]{0,19}")),
                          ],
                          focusNode: _idFocusNode,
                          onChanged: (id) {
                            _idCheckProvider.falseCheck();
                            _idCheckProvider.setId(id);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: "???????????? ??????????????????",
                            hintStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xffC1C1C1)),
                            contentPadding: EdgeInsets.only(
                                left: 20.w, top: 16.h, bottom: 17.h),
                            suffixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10.h, 15.w, 10.h),
                              child: OutlinedButton(
                                onPressed: () {
                                  _idCheckProvider.trueCheck();
                                  _idCheckProvider
                                      .loadIdCheck(_idCheckProvider.id);
                                },
                                child: Text(
                                  "????????????",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0099FF)),
                                ),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding:
                                      EdgeInsets.fromLTRB(18.w, 8.h, 21.w, 7.h),
                                  side: BorderSide(color: Color(0xff0099FF)),
                                ),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          SizedBox(
                            width: 290.w,
                            height: 33.h,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xff707070),
                                      letterSpacing: -0.25.w),
                                  children: [
                                    TextSpan(
                                        text:
                                            "???????????? ?????? ??????, ????????? ????????? 4?????? ????????? ???????????? ??????\n"),
                                    TextSpan(text: "????????????."),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        children: [
                          UserJoinText(text: "????????????"),
                          SizedBox(
                            width: 8.w,
                          ),
                          UserJoinPwCheck(),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      UserJoinPwBox(
                        text: "??????????????? ????????? ?????????",
                        widgetKey: context.read<PwCheckProvider>().pwKey,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      UserJoinPwBox(
                        text: "??????????????? ?????? ????????? ?????????",
                        widgetKey: context.read<PwCheckProvider>().pwCheckKey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          SizedBox(
                            width: 290.w,
                            height: 33.h,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xff707070),
                                      letterSpacing: -0.25.w),
                                  children: [
                                    TextSpan(
                                        text:
                                            "??????????????? ???????????? ??????????????? ?????? ???????????? ?????? ??????,??????,??????????????? ????????? 8?????? ????????? ???????????? ????????? ?????????."),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      UserJoinText(text: "??????"),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          onChanged: (value) {
                            _name = value;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r"^[a-zA-Z???-??????-??????-???]{0,8}"),
                                allow: true)
                          ],
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: "????????? ??????????????????",
                            hintStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xffC1C1C1)),
                            contentPadding: EdgeInsets.only(
                                left: 20.w, top: 16.h, bottom: 17.h),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      UserJoinText(text: "?????????"),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          inputFormatters: [
                            //??????1
                            // FilteringTextInputFormatter(RegExp('^[\]]'),
                            //     allow: false)
                            //??????2
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^[0-9]{0,8}")),
                            //??????3
                            // FilteringTextInputFormatter.digitsOnly,
                            // LengthLimitingTextInputFormatter(8),
                          ],
                          onChanged: (value) {
                            _joinPhoneNumberProvider.setPhoneNumber(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: "?????????????????? ??????????????????",
                            hintStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xffC1C1C1)),
                            contentPadding:
                                EdgeInsets.only(top: 16.h, bottom: 17.h),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 10.w),
                              child: SizedBox(
                                height: 14.h,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    menuMaxHeight: 200,
                                    iconSize: 28.w,
                                    iconEnabledColor: Color(0xff020202),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff020202)),
                                    items: [
                                      "010",
                                      "011",
                                      "02",
                                      "031",
                                      "032",
                                      "033",
                                      "041",
                                      "042",
                                      "043",
                                      "044",
                                      "051",
                                      "052",
                                      "053",
                                      "054",
                                      "055",
                                      "061",
                                      "062",
                                      "063",
                                      "064",
                                    ]
                                        .map(
                                          (String item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    value: context.select(
                                        (JoinPhoneNumberProvider e) =>
                                            e.firstPhoneNumber),
                                    onChanged: (String? value) => {
                                      _joinPhoneNumberProvider
                                          .setFirstPhoneNumber(value!),
                                    },
                                  ),
                                ),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      UserJoinText(text: "?????????"),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          onChanged: (value) {
                            _email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: "????????? ????????? ??????????????????",
                            hintStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xffC1C1C1)),
                            contentPadding: EdgeInsets.only(
                                left: 20.w, top: 16.h, bottom: 17.h),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      UserJoinText(text: "??????"),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          readOnly: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: context
                                .select((JoinAddressProvider e) => e.address),
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: _joinAddressProvider.getAddressColor()),
                            contentPadding: EdgeInsets.only(
                                left: 20.w, top: 16.h, bottom: 17.h),
                            suffixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10.h, 15.w, 10.h),
                              child: OutlinedButton(
                                onPressed: () async {
                                  _joinAddressProvider
                                      .loadAddressFindScreen(context);
                                },
                                child: Text(
                                  "?????? ??????",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0099FF)),
                                ),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding:
                                      EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
                                  side: BorderSide(color: Color(0xff0099FF)),
                                ),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: _addressDetailController,
                          onChanged: (value) {
                            _joinAddressProvider.setDetailAddress(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.r),
                              borderSide: BorderSide(color: Color(0xffE2E2E2)),
                            ),
                            hintText: "??????????????? ??????????????????",
                            hintStyle: TextStyle(
                                fontSize: 14.sp, color: Color(0xffC1C1C1)),
                            contentPadding: EdgeInsets.only(
                                left: 20.w, top: 16.h, bottom: 17.h),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    color: const Color(0xff0099FF),
                                    width: 2.w)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 360.w,
                height: 60.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0099FF),
                  ),
                  onPressed: () {
                    if (_idCheckProvider.id == "" ||
                        !_idCheckProvider.check ||
                        _idCheckProvider.idCheck!.getStatusCode() != "200") {
                      _idFocusNode.requestFocus();
                      _showToast("????????? ??????????????? ???????????????.");
                      return;
                    }
                    if (_pwCheckProvider.checkPw() &&
                        _pwCheckProvider.pw == "") {
                      _showToast("??????????????? ???????????? ????????????.");
                      return;
                    }
                    if (!_joinAddressProvider
                        .getAddress()
                        .contains("?????? ????????????")) {
                      _showToast("????????? ????????? ????????? ???????????????.");
                      _joinAddressProvider.clearAddress();
                      _addressDetailController.clear();
                      setState(() {});
                      return;
                    }
                    _joinProvider
                        .join(
                          id: _idCheckProvider.id,
                          pw: _pwCheckProvider.getPw(),
                          name: _name,
                          phoneNum: _joinPhoneNumberProvider.getPhoneNumber(),
                          email: _email,
                          address: _joinAddressProvider.getAddress(),
                          addressDetail:
                              _joinAddressProvider.getDetailAddress(),
                          memType: _joinConditionProvider.typeCheck == true
                              ? "????????????"
                              : "????????????",
                        )
                        .then((value) => {
                              if (_joinProvider.joinSuccessCheck)
                                {
                                  Navigator.pop(context),
                                  _joinConditionProvider.clear(),
                                  _showToast("??????????????? ?????????????????????."),
                                }
                              else
                                {
                                  _showToast(_joinProvider.message),
                                }
                            });
                  },
                  child: Text(
                    "????????????",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xff6E6E6E),
        fontSize: 13.sp,
        toastLength: Toast.LENGTH_SHORT);
  }
}
