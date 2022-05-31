import 'package:carousel_slider/carousel_slider.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/style.dart';
import '../widgets/text_button.dart';
import '../widgets/text_form_filed.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  static final List<String> imgList = [
    'assets/images/3.png',
    'assets/images/3.png',
    'assets/images/3.png',
    'assets/images/3.png',
  ];

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  CarouselController buttonCarouselController = CarouselController();

  bool request = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: 60.h,
                    child: CarouselSlider.builder(itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                      return Image.asset('assets/images/3.png',width: width,
                        height: 60.h,fit: BoxFit.fill,);
                    },
                      itemCount: ItemDetailsScreen.imgList.length,
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        height: height * 0.6,
                        viewportFraction: 1.5,
                        aspectRatio: 16/9,
                        initialPage: 0,
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back_ios,color: white,size: 30,),
                        Icon(Icons.bookmark_border_rounded,color: white,size: 30,)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'Egp 23,456',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 20)),
                                TextSpan(text: '  Studio Apartment',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text('23 Cross, HRBR Layout, Bangalore',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                        ),
                        SizedBox(height: 3.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 5.w,),
                            SvgPicture.asset('assets/icons/bed.svg',color: white,),
                            SizedBox(width: 2.w,),
                            Text('3 Bed',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                            SizedBox(width: 5.w,),
                            SvgPicture.asset('assets/icons/bath.svg',color: white,),
                            SizedBox(width: 2.w,),
                            Text('3 Bath',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                            SizedBox(width: 5.w,),
                            SvgPicture.asset('assets/icons/car.svg',color: white,),
                            SizedBox(width: 2.w,),
                            Text('3 Parking',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 10.h,
                  width: 98.w,
                  child: ListView.separated(itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: 20.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Image.asset('assets/images/3.png',fit: BoxFit.cover,width: width*0.2,
                        height: 6.h,),
                    );
                  },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: ItemDetailsScreen.imgList.length),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              request ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(tr('name'),style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: 1.h,),
                    Container(
                      width: 90.w,
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
                    Text(tr('phone'),style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: 1.h,),
                    Container(
                      width: 90.w,
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
                    Text(tr('message'),style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: 1.h,),
                    Container(
                      width: 90.w,
                      height: 15.h,
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
                        min: 6,
                        isPass: false,),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: MyButtonWidget(
                          btnTxt: tr('send'),
                          btnWidth: 90.w,
                          btnHeight: 5.h,
                          onPressed: () {
                            Navigator.pushNamed(context, confirmRequest);
                          },
                          color: buttonColor,
                          borderColor: buttonColor,
                          weight: FontWeight.w600,
                          textSize: 16,
                          textColor: Colors.white),
                    ),
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(tr('feature'),style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(tr('desc'),style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text('Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo Dolores Et Ea Rebum. Stet Clita Kasd Gubergren, No Sea Takimata Sanctus Est Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: MyButtonWidget(
                          btnTxt: tr('request'),
                          btnWidth: 90.w,
                          btnHeight: 5.h,
                          onPressed: () {
                            setState(() {
                              request = true;
                            });
                          },
                          color: buttonColor,
                          borderColor: buttonColor,
                          weight: FontWeight.w600,
                          textSize: 16,
                          textColor: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
