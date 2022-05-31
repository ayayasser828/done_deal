import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:math' as math show pi;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../../utils/get_lang.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static final List<String> titleList = [
    tr('trans'),
    tr('send_con'),
    tr('chat'),
    tr('change_pass'),
    tr('change_lang'),
    tr('log'),
  ];

  static final List<String> actionList = [
    trans,
    sendContract,
    tr('chat'),
    changePass,
    tr('change_lang'),
    login,
  ];

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notify = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          width: 80.w,
          height: 70.h,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                topLeft: Radius.circular(17),
                bottomRight: Radius.circular(17)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/profile.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Column(
                    children: [
                      Text(tr('acc'),
                          style: textStyle.copyWith(color: Colors.black),
                          textAlign: TextAlign.center),
                      const Text('10000 Egp',
                          style: textStyle, textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 40.h,
                width: 70.w,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('trans'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          Navigator.pushNamed(context, trans);
                        },),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('send_con'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          Navigator.pushNamed(context, sendContract);
                        },),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('chat'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          Navigator.pushNamed(context, chat);
                        },),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('change_pass'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          Navigator.pushNamed(context, changePass);
                        },),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('change_lang'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          return changeLang(context);
                        },),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/notify.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          child: Text(
                            tr('log'),
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
                        },),
                      ],
                    ),
                  ],
                )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    tr('notify'),
                    style:
                        textStyle.copyWith(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(
                        context.locale.languageCode == 'ar' ? math.pi : 0),
                    child: FlutterSwitch(
                      width: 50.0,
                      height: 27,
                      value: notify,
                      borderRadius: 30.0,
                      showOnOff: false,
                      activeColor: buttonColor,
                      inactiveColor: Colors.white,
                      switchBorder: Border.all(
                        color: grey,
                        width: 1.0,
                      ),
                      padding: 0,
                      activeToggleColor: white,
                      inactiveToggleColor: grey,
                      onToggle: (v) {
                        setState(() {
                          notify = !notify;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void changeLang(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(
            tr('change_lang'),
            style:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          actions: [
            Center(
              child: FlatButton(
                  onPressed: () {
                    if (context.locale.languageCode == 'ar') {
                      GetLAng.lang = 'en_US';
                      context.setLocale(const Locale('en', 'US'));
                    } else {
                      GetLAng.lang = 'ar_EG';
                      context.setLocale(const Locale('ar', 'EG'));
                    }
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: buttonColor,
                    ),
                    child: Center(
                        child: Text(
                            context.locale.languageCode == 'ar'
                                ? 'ENGLISH'
                                : "عربي",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,color: white))),
                  )),
            )
          ],
        ));
  }
}
