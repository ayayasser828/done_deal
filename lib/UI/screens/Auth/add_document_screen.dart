import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/style.dart';
import '../../widgets/text_button.dart';

class AddDocScreen extends StatefulWidget {
  const AddDocScreen({Key? key}) : super(key: key);

  @override
  State<AddDocScreen> createState() => _AddDocScreenState();
}

class _AddDocScreenState extends State<AddDocScreen> {
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
                  SizedBox(width: 10.w,),
                  SizedBox(
                    width: 50.w,
                    height: 12.h,
                    child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                  )
                ],
              ),
              SizedBox(height: 2.h,),
              Text(tr('doc'),style: textStyle.copyWith(fontSize: 20),),
              SizedBox(height: 2.h,),
              SizedBox(
                width: 85.w,
                height: 73.h,
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
                        Text(tr('id'),style: textStyle.copyWith(color: Colors.black),textAlign: TextAlign.center),
                        SizedBox(height: 3.h,),
                        Row(
                          children: [
                            buildImagePicker(image: image),
                            InkWell(
                              onTap: () => pickImage(),
                              child: SizedBox(
                                height: 20.h,
                                width: 70.w,
                                child: Image.asset(
                                  'assets/images/drag-drop-upload-1.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.h,),
                        MyButtonWidget(
                            btnTxt: tr('send'),
                            btnWidth: 78.w,
                            btnHeight: 5.h,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, confirm, (route) => false),
                            color: buttonColor,
                            borderColor: buttonColor,
                            weight: FontWeight.w600,
                            textSize: 16,
                            textColor: Colors.white),
                        SizedBox(height: 5.h,),
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
