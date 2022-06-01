import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../widgets/text_button.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(width: 10.w,),
                SizedBox(
                  width: 50.w,
                  height: 12.h,
                  child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                )
              ],
            ),
            SizedBox(height: 4.h,),
            Text(tr('registered'),style: textStyle.copyWith(fontSize: 20.sp),),
            SizedBox(height: 17.h,),
            SvgPicture.asset('assets/images/success.svg'),
            SizedBox(height: 12.h,),
            MyButtonWidget(
                btnTxt: tr('to_home'),
                btnWidth: 78.w,
                btnHeight: 5.h,
                onPressed: () => Navigator.pushNamed(context, navBar),
                color: buttonColor,
                borderColor: buttonColor,
                weight: FontWeight.w600,
                textSize: 15.sp,
                textColor: Colors.white),
            SizedBox(height: 5.h,),
          ],
        ),
      )),
    );
  }
}
