import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';
import '../widgets/text_button.dart';
import '../widgets/text_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
            Text('Register Your account',style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: height*0.04,),
            SizedBox(
              width: width*0.85,
              height: height*0.65,
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
                      const Text('NAME',style: textStyle,textAlign: TextAlign.center),
                      SizedBox(height: height*0.01,),
                      Container(
                        width: width*0.72,
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
                      SizedBox(height: height*0.01,),
                      const Text('PHONE',style: textStyle,textAlign: TextAlign.center),
                      SizedBox(height: height*0.01,),
                      Container(
                        width: width*0.72,
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
                      SizedBox(height: height*0.01,),
                      const Text('Date of birth',style: textStyle,textAlign: TextAlign.center),
                      SizedBox(height: height*0.01,),
                      Container(
                        width: width*0.72,
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
                      SizedBox(height: height*0.01,),
                      const Text('gender',style: textStyle,textAlign: TextAlign.center),
                      SizedBox(height: height*0.01,),
                      Container(
                        width: width*0.3,
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
                      SizedBox(height: height*0.08,),
                      MyButtonWidget(
                          btnTxt: 'NEXT',
                          btnWidth: width * 0.78,
                          btnHeight: height * 0.055,
                          onPressed: () {},
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
          ],
        ),
      )),
    );
  }
}
