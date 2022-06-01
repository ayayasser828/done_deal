import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background2,
      body: Center(
        child: Container(
          width: 80.w,
          height: 70.h,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                topLeft: Radius.circular(17),
                bottomRight: Radius.circular(17)
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 1.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/profile.svg',fit: BoxFit.scaleDown,),
                  SizedBox(width: 3.w,),
                  Text(tr('notify'),style: textStyle.copyWith(color: Colors.black),textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: 1.h,),
              SizedBox(
                height: 60.h,
                width: 70.w,
                child: ListView.separated(itemBuilder: (BuildContext context, int index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/notify.svg',fit: BoxFit.scaleDown,),
                      SizedBox(width: 1.w,),
                      Expanded(child: Text('The balance has been successfully credited',style: textStyle.copyWith(color: Colors.black,fontSize: 11.sp),textAlign: TextAlign.center,maxLines: 1,)),
                    ],
                  );
                }, separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                    scrollDirection: Axis.vertical,
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
