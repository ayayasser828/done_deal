import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                SizedBox(height: 4.h,),
                Text(tr('welcome'),style: textStyle.copyWith(fontSize: 20),),
                SizedBox(height: 2.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(tr('login'),style: textStyle,textAlign: TextAlign.center),
                ),
                SizedBox(height: 4.h,),
                SizedBox(
                  width: 85.w,
                  height: 60.h,
                  child: Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)
                        )),
                    elevation: 9,
                    child: Form(child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h,),
                          Text(tr('phone'),style: textStyle,textAlign: TextAlign.center),
                          SizedBox(height: 1.h,),
                          Container(
                            width: 72.w,
                            decoration: const BoxDecoration(
                              color: textFieldColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(17),
                                    topLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17)
                                )
                            ),
                            child: const MyTextFormFieldWidget(
                              style: TextStyle(fontSize: 23,color: Colors.grey),
                              type: TextInputType.number,
                              color: Colors.white,
                              isPass: false,),
                          ),
                          SizedBox(height: 1.h,),
                          Text(tr('pass'),style: textStyle,textAlign: TextAlign.center),
                          SizedBox(height: 1.h,),
                          Container(
                            width: 72.w,
                            decoration: const BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(17),
                                    topLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17)
                                )
                            ),
                            child: const MyTextFormFieldWidget(
                              style: TextStyle(fontSize: 23,color: Colors.grey),
                              type: TextInputType.number,
                              color: Colors.white,
                              isPass: false,),
                          ),
                          SizedBox(height: 0.5.h,),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: tr('forget'),style: textStyle.copyWith(fontSize: 10),),
                                TextSpan(text: tr('reset'),style: textStyle.copyWith(fontSize: 10,color: buttonColor),),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          MyButtonWidget(
                              btnTxt: tr('login_now'),
                              btnWidth: 78.w,
                              btnHeight: 5.h,
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, navBar, (route) => false),
                              color: buttonColor,
                              borderColor: buttonColor,
                              weight: FontWeight.w600,
                              textSize: 16,
                              textColor: Colors.white),
                          SizedBox(height: 5.h,),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, register);
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: tr('have_acc'),style: textStyle.copyWith(fontSize: 10),),
                                    TextSpan(text: tr('register'),style: textStyle.copyWith(fontSize: 10,color: buttonColor),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
