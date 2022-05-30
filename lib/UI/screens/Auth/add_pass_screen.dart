import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/strings.dart';
import '../../../constant/style.dart';
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
              Text('Add Your Password',style: textStyle.copyWith(fontSize: 20),),
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
                        const Text('password',style: textStyle,textAlign: TextAlign.center),
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
                        const Text('re - password',style: textStyle,textAlign: TextAlign.center),
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
                        SizedBox(height: height*0.1,),
                        MyButtonWidget(
                            btnTxt: 'Register Now',
                            btnWidth: width * 0.78,
                            btnHeight: height * 0.055,
                            onPressed: () => Navigator.pushNamed(context, addDoc),
                            color: buttonColor,
                            borderColor: buttonColor,
                            weight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white),
                        SizedBox(height: height*0.05,),
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