import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
                  const Icon(Icons.arrow_back_ios),
                  SizedBox(width: width*0.15,),
                  SizedBox(
                    width: width*0.5,
                    height: height*0.12,
                    child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                  )
                ],
              ),
              SizedBox(height: height*0.02,),
              Text('Documents',style: textStyle.copyWith(fontSize: 20),),
              SizedBox(height: height*0.02,),
              SizedBox(
                width: width*0.85,
                height: height*0.73,
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
                        Text('ID card',style: textStyle.copyWith(color: Colors.black),textAlign: TextAlign.center),
                        SizedBox(height: height*0.03,),
                        Row(
                          children: [
                            buildImagePicker(image: image),
                            InkWell(
                              onTap: () => pickImage(),
                              child: SizedBox(
                                height: height * 0.2,
                                width: width*0.7,
                                child: Image.asset(
                                  'assets/images/drag-drop-upload-1.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.07,),
                        MyButtonWidget(
                            btnTxt: 'Send Now',
                            btnWidth: width * 0.78,
                            btnHeight: height * 0.055,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, confirm, (route) => false),
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
