import 'package:carousel_slider/carousel_slider.dart';
import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:done_deal/constant/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  static final List<String> imgList = [
    'assets/images/walk.svg',
    'assets/images/walk.svg',
    'assets/images/walk.svg',
  ];
  static final List<String> titleList = [
    tr('on_boarding_title'),
    tr('on_boarding_title'),
    tr('on_boarding_title'),
  ];
  static final List<String> textList = [
    tr('on_boarding_text'),
    tr('on_boarding_text'),
    tr('on_boarding_text'),
  ];

  static int index = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          if (index == 2) {
            Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
          } else {
            setState(() {
              index++;
            });
          }
        },
        child: Container(
          width: 10.w,
          height: 10.h,
          decoration: const BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
          ),
          child: const Center(
              child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider.builder(itemCount: imgList.length, itemBuilder: (BuildContext context,int itemIndex,int pageViewIndex){
              return Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: width,
                    height: 30.h,
                    child: SvgPicture.asset(imgList[itemIndex]),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    titleList[itemIndex],
                    style: textStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Text(textList[itemIndex],
                        style: textStyle, textAlign: TextAlign.center),
                  ),
                ],
              );
            }, carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: height * 0.7,
                viewportFraction: 1.1,
                aspectRatio: 16 / 9,
                initialPage: 0,
                onPageChanged: (pageIndex, reason) {
                  setState(() {
                    index = pageIndex;
                  });
                }
              ),),
            SizedBox(
                width: 15.w,
                height: 7.h,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == itemIndex ? textColor : Colors.grey,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: imgList.length,
                  scrollDirection: Axis.horizontal,
                )),
          ],
        ),
      )),
    );
  }
}
