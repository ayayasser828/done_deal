import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../../constant/colors.dart';
import '../../../constant/style.dart';
import '../../../utils/get_lang.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class SendContract extends StatefulWidget {
  const SendContract({Key? key}) : super(key: key);

  @override
  State<SendContract> createState() => _SendContractState();
}

class _SendContractState extends State<SendContract> {
  static final List<String> genderList = [
    tr('male'),
    tr('female'),
  ];

  String? selectedGender;
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
              SizedBox(height: 2.h,),
              Text(tr('send_con'),style: textStyle.copyWith(fontSize: 20.sp),),
              SizedBox(height: 2.h,),
              SizedBox(
                width: 85.w,
                height: 74.h,
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
                        Text(tr('choose_comp'),style: textStyle,textAlign: TextAlign.center),
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
                        SizedBox(height: 1.h,),
                        Text(tr('client_name'),style: textStyle,textAlign: TextAlign.center),
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
                        Text(tr('client_phone'),style: textStyle,textAlign: TextAlign.center),
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
                        Text(tr('upload'),style: textStyle,textAlign: TextAlign.center),
                        InkWell(
                          onTap: () => pickImage(),
                          child: SizedBox(
                            height: 20.h,
                            width: 70.w,
                            child: image == null ? Image.asset(
                              'assets/images/Group 46.png',
                            ) : buildImagePicker(image: image),
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        MyButtonWidget(
                            btnTxt: tr('send'),
                            btnWidth: 78.w,
                            btnHeight: 5.h,
                            onPressed: () {},
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

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  Widget buildImagePicker({File? image}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image != null
                ? Image.file(
              image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            )
                : Container(),
          ),
        ),
        Positioned(
          right: 4.0,
          top: 0.0,
          child: InkWell(
            onTap: () {},
            child: Material(
                color: buttonColor,
                shape: const CircleBorder(),
                child: image != null
                    ? const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                )
                    : Container()),
          ),
        ),
      ],
    );
  }
}
