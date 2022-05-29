import 'package:done_deal/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';
import '../widgets/text_button.dart';
import '../widgets/text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            Text('Welcome To DoneDell',style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Text('Login to your account',style: textStyle,textAlign: TextAlign.center),
            ),
            SizedBox(height: height*0.04,),
            SizedBox(
              width: width*0.85,
              height: height*0.6,
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
                      const Text('Phone',style: textStyle,textAlign: TextAlign.center),
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
                      const Text('Password',style: textStyle,textAlign: TextAlign.center),
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
                      SizedBox(height: height*0.005,),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Forget Password ? ',style: textStyle.copyWith(fontSize: 10),),
                            TextSpan(text: 'reset',style: textStyle.copyWith(fontSize: 10,color: buttonColor),),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.05,),
                      MyButtonWidget(
                          btnTxt: 'login Now',
                          btnWidth: width * 0.78,
                          btnHeight: height * 0.055,
                          onPressed: () {},
                          color: buttonColor,
                          borderColor: buttonColor,
                          weight: FontWeight.w600,
                          textSize: 16,
                          textColor: Colors.white),
                      SizedBox(height: height*0.05,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, register);
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Don't have an account ? ",style: textStyle.copyWith(fontSize: 10),),
                                TextSpan(text: 'register now',style: textStyle.copyWith(fontSize: 10,color: buttonColor),),
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
      )),
    );
  }
}
