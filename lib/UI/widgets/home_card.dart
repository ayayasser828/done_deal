
import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:done_deal/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget homeCard(BuildContext context){
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
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    width: 21.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black38
                    ),
                    child: Center(child: Text('Furnitured',style: textStyle.copyWith(color: white,fontSize: 12),)),
                  ),
                  SizedBox(width: 0.8.w,),
                  Container(
                    width: 21.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black38
                    ),
                    child: Center(child: Text('Pet Friendly',style: textStyle.copyWith(color: white,fontSize: 12),)),
                  ),
                  SizedBox(width: 32.w,),
                  const Icon(Icons.bookmark_border_rounded,color: white,)
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
                TextSpan(text: 'Egp 23,456',style: textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20)),
                TextSpan(text: '  Studio Apartment',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('23 Cross, HRBR Layout, Bangalore',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
        ),
        SizedBox(height: height*0.03,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/icons/bed.svg'),
            Text('3 Bed',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
            SvgPicture.asset('assets/icons/bath.svg'),
            Text('3 Bath',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
            SvgPicture.asset('assets/icons/car.svg'),
            Text('3 Parking',style: textStyle.copyWith(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 15),),
          ],
        )
      ],
    ),
  );
}