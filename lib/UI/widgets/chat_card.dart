import 'package:done_deal/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget chatCard(BuildContext context){
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Row(
    children: [
      const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/images/avatar.png',),
      ),
      SizedBox(width: 3.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Maryam',style: textStyle3,),
          SizedBox(height: 1.h,),
          const Text('Sound good'),
        ],
      ),
      SizedBox(width: 40.w,),
      const Text('16:30',style: textStyle3,),
    ],
  );
}