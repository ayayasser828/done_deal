import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';
import '../../../constant/style.dart';
import '../../widgets/text_button.dart';

class OTPPassScreen extends StatelessWidget {
  OTPPassScreen({Key? key}) : super(key: key);

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 90;

  void onEnd() {
    Row(
      children: const [
        Icon(
          Icons.refresh,
          color: buttonColor,
        ),
        Text(
          "Request a new code ",
          style: textStyle2,
        ),
      ],
    );
  }

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
              Text('OTP PASSWORD',style: textStyle.copyWith(fontSize: 20),),
              SizedBox(height: height*0.04,),
              SizedBox(
                width: width*0.85,
                height: height*0.32,
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
                        SizedBox(height: height*0.01,),
                        const Text('Enter 4 number sent to you on your phone'),
                        SizedBox(height: height*0.01,),
                        const Center(child: Text('+201033076500',style: textStyle,textAlign: TextAlign.center)),
                        SizedBox(height: height*0.03,),
                        SizedBox(width: width*0.8,height: height*0.1,child: buildPinCodeFields(context),),
                        SizedBox(height: height*0.01,),
                        MyButtonWidget(
                            btnTxt: 'verify now',
                            btnWidth: width * 0.78,
                            btnHeight: height * 0.055,
                            onPressed: () => Navigator.pushNamed(context, addPass),
                            color: buttonColor,
                            borderColor: buttonColor,
                            weight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white),
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(height: height*0.02,),
              Center(
                child: CountdownTimer(
                  endTime: endTime,
                  textStyle: textStyle2,
                  onEnd: onEnd,
                  endWidget: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Request a new code ",
                          style: textStyle2,
                        ),
                        Icon(
                          Icons.refresh,
                          color: buttonColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
  Widget buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(17),
            topLeft: Radius.circular(17),
            bottomRight: Radius.circular(17)
        ),
        fieldHeight: 50,
        fieldWidth: 50,
        borderWidth: 1,
        activeColor: textFieldColor,
        inactiveColor: textFieldColor,
        inactiveFillColor: textFieldColor,
        activeFillColor: textFieldColor,
        selectedColor: textFieldColor,
        selectedFillColor: textFieldColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (submittedCode) {},
      onChanged: (String value) {},
    );
  }
}
