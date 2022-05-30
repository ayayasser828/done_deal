import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                const Icon(Icons.arrow_back_ios),
                SizedBox(width: width*0.15,),
                SizedBox(
                  width: width*0.5,
                  height: height*0.12,
                  child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                )
              ],
            ),
            SizedBox(height: height*0.04,),
            Text('Your request has been sent',style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: height*0.17,),
            SvgPicture.asset('assets/images/success.svg'),
            SizedBox(height: height*0.2,),
            MyButtonWidget(
                btnTxt: 'Back to home',
                btnWidth: width * 0.78,
                btnHeight: height * 0.055,
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, navBar, (route) => false),
                color: buttonColor,
                borderColor: buttonColor,
                weight: FontWeight.w600,
                textSize: 16,
                textColor: Colors.white),
            SizedBox(height: height*0.05,),
          ],
        ),
      )),
    );
  }
}
