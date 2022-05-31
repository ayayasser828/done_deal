import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';
import '../../constant/style.dart';
import '../widgets/text_button.dart';

class ConfirmRequestScreen extends StatelessWidget {
  const ConfirmRequestScreen({Key? key}) : super(key: key);

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
            Text(tr('req_sent'),style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: 17.h,),
            SvgPicture.asset('assets/images/success.svg'),
            SizedBox(height: 20.h,),
            MyButtonWidget(
                btnTxt: tr('back_home'),
                btnWidth: 78.w,
                btnHeight: 5.h,
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, navBar, (route) => false),
                color: buttonColor,
                borderColor: buttonColor,
                weight: FontWeight.w600,
                textSize: 16,
                textColor: Colors.white),
            SizedBox(height: 5.h,),
          ],
        ),
      )),
    );
  }
}
