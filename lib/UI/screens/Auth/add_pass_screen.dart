import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';
import '../../../constant/style.dart';
import '../../../utils/get_lang.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class AddPassScreen extends StatelessWidget {
  const AddPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(width: GetLAng.lang == 'en_US'
                      ? 10.w : 6.w,),
                  SizedBox(
                    width: 50.w,
                    height: 12.h,
                    child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                  )
                ],
              ),
              SizedBox(height: 4.h,),
              Text(tr('add_pass'),style: textStyle.copyWith(fontSize: 20.sp),),
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
                            type: TextInputType.name,
                            color: Colors.white,
                            isPass: false,),
                        ),
                        SizedBox(height: 1.h,),
                        Text(tr('re_pass'),style: textStyle,textAlign: TextAlign.center),
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
                            type: TextInputType.name,
                            color: Colors.white,
                            isPass: false,),
                        ),
                        SizedBox(height: 10.h,),
                        MyButtonWidget(
                            btnTxt: tr('register'),
                            btnWidth: 78.w,
                            btnHeight: 5.h,
                            onPressed: () => Navigator.pushNamed(context, addDoc),
                            color: buttonColor,
                            borderColor: buttonColor,
                            weight: FontWeight.w600,
                            textSize: 15.sp,
                            textColor: Colors.white),
                        SizedBox(height: 5.h,),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
