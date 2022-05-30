import 'package:carousel_slider/carousel_slider.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    height: height*0.6,
                    child: CarouselSlider.builder(itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                      return Image.asset('assets/images/3.png',width: width,
                        height: height*0.6,fit: BoxFit.fill,);
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
                        SizedBox(height: height*0.03,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: width*0.05,),
                            SvgPicture.asset('assets/icons/bed.svg',color: white,),
                            SizedBox(width: width*0.02,),
                            Text('3 Bed',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                            SizedBox(width: width*0.05,),
                            SvgPicture.asset('assets/icons/bath.svg',color: white,),
                            SizedBox(width: width*0.02,),
                            Text('3 Bath',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                            SizedBox(width: width*0.05,),
                            SvgPicture.asset('assets/icons/car.svg',color: white,),
                            SizedBox(width: width*0.02,),
                            Text('3 Parking',style: textStyle.copyWith(color: white,fontWeight: FontWeight.w400,fontSize: 15),),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height*0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: height*0.1,
                  width: width*0.98,
                  child: ListView.separated(itemBuilder: (BuildContext context, int index){
                    return Container(
                      width: width*0.2,
                      height: height*0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Image.asset('assets/images/3.png',fit: BoxFit.cover,width: width*0.2,
                        height: height*0.06,),
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
                height: height*0.03,
              ),
              request ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Name',style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: height*0.01,),
                    Container(
                      width: width*0.9,
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
                    const Text('phone',style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: height*0.01,),
                    Container(
                      width: width*0.9,
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
                    const Text('message',style: textStyle,textAlign: TextAlign.center),
                    SizedBox(height: height*0.01,),
                    Container(
                      width: width*0.9,
                      height: height*0.15,
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
                      height: height*0.03,
                    ),
                    Center(
                      child: MyButtonWidget(
                          btnTxt: 'Send',
                          btnWidth: width * 0.9,
                          btnHeight: height * 0.055,
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
                    Text('Features',style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2 Movie Theatre',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                        Text('2Km',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                      ],),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Text('Description',style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Text('Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua. At Vero Eos Et Accusam Et Justo Duo Dolores Et Ea Rebum. Stet Clita Kasd Gubergren, No Sea Takimata Sanctus Est Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Center(
                      child: MyButtonWidget(
                          btnTxt: 'Request',
                          btnWidth: width * 0.9,
                          btnHeight: height * 0.055,
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
                height: height*0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
