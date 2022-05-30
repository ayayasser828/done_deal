import 'package:done_deal/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Text('Registered',style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: height*0.17,),
            SvgPicture.asset('assets/images/success.svg'),
            SizedBox(height: height*0.12,),
            MyButtonWidget(
                btnTxt: 'Go to home',
                btnWidth: width * 0.78,
                btnHeight: height * 0.055,
                onPressed: () => Navigator.pushNamed(context, navBar),
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
