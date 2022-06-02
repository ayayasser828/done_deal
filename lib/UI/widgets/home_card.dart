
import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:done_deal/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, itemDetails),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/3.png',width: width,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 18),
                child: Row(
                  children: [
                    Container(
                      width: 21.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black38
                      ),
                      child: Center(child: Text('Furnitured',style: textStyle.copyWith(color: white,fontSize: 10.sp),)),
                    ),
                    SizedBox(width: 0.8.w,),
                    Container(
                      width: 21.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black38
                      ),
                      child: Center(child: Text('Pet Friendly',style: textStyle.copyWith(color: white,fontSize: 10.sp),)),
                    ),
                    SizedBox(width: 27.w,),
                    IconButton(onPressed: (){
                      setState(() {
                        isFav = !isFav;
                      });
                    }, icon: Icon(isFav ? Icons.bookmark : Icons.bookmark_border_rounded,color: isFav ? Colors.red : white,))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Egp 23,456',style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 17.sp)),
                  TextSpan(text: '  Studio Apartment',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 10.sp),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('23 Cross, HRBR Layout, Bangalore',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 12.sp),),
          ),
          SizedBox(height: height*0.03,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/icons/bed.svg'),
              Text('3 Bed',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 13.sp),),
              SvgPicture.asset('assets/icons/bath.svg'),
              Text('3 Bath',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 13.sp),),
              SvgPicture.asset('assets/icons/car.svg'),
              Text('3 Parking',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 13.sp),),
            ],
          )
        ],
      ),
    );
  }
}
