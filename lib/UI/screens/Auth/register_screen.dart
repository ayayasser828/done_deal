import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../../utils/get_lang.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final List<String> genderList = [
    tr('male'),
    tr('female'),
  ];

  String? selectedGender;

  int groupValue = -1;

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
              Text(tr('register_acc'),style: textStyle.copyWith(fontSize: 20.sp),),
              SizedBox(height: 1.h,),
              SizedBox(
                width: 85.w,
                height: 72.h,
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
                        Text(tr('name'),style: textStyle,textAlign: TextAlign.center),
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
                        Text(tr('date'),style: textStyle,textAlign: TextAlign.center),
                        SizedBox(height: 1.h,),
                        Stack(
                          children: [
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
                              child: MyTextFormFieldWidget(
                                style: TextStyle(fontSize: 23,color: Colors.grey),
                                type: TextInputType.number,
                                controller: _birthdayController,
                                color: Colors.white,
                                isPass: false,),
                            ),
                            InkWell(
                              onTap: _selectDate,
                              child: Container(
                                width: double.infinity,
                                height: height * 0.05,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Text(tr('gender'),style: textStyle,textAlign: TextAlign.center),
                        SizedBox(height: 1.h,),
                        Container(
                          width: 30.w,
                          decoration: const BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(17),
                                  topLeft: Radius.circular(17),
                                  bottomRight: Radius.circular(17)
                              )
                          ),
                          child: SimpleDropDown<String>(
                            isRequired: true,
                            list: genderList.isEmpty ? [] : genderList,
                            onChanged: (gender) {
                              setState(() {
                                selectedGender = gender;
                              });
                            },
                            onSaved: (gender) {
                              setState(() {
                                selectedGender = gender;
                              });
                            },
                            value: selectedGender,
                            title: 'Gender',
                            validator: (city) => city != null
                                ? null
                                : 'Select Gender',
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  activeColor: textColor,
                                  value: 0,
                                  groupValue: groupValue,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  },
                                ),
                                Text('Client',style: textStyle.copyWith(fontSize: 10.sp,color: buttonColor),)
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: textColor,
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  },
                                ),
                                Text('Freelancer',style: textStyle.copyWith(fontSize: 10.sp,color: buttonColor),)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        MyButtonWidget(
                            btnTxt: tr('next'),
                            btnWidth: 78.w,
                            btnHeight: 5.h,
                            onPressed: () => Navigator.pushNamed(context, otp),
                            color: buttonColor,
                            borderColor: buttonColor,
                            weight: FontWeight.w600,
                            textSize: 15.sp,
                            textColor: Colors.white),
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

  DateTime? _selectedDate;
  final TextEditingController _birthdayController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1970, 1),
      firstDate: DateTime(1970, 1),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    print(picked);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text =
            DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
    print(_selectedDate);
    print(_birthdayController.text);
  }
}
