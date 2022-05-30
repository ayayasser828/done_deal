import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/colors.dart';
import '../../../constant/style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          width: width*0.8,
          height: height*0.7,
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
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/profile.svg',fit: BoxFit.scaleDown,),
                  SizedBox(width: width*0.01,),
                  Text('Notification',style: textStyle.copyWith(color: Colors.black),textAlign: TextAlign.center),
                ],
              ),
              SizedBox(height: height*0.01,),
              SizedBox(
                height: height*0.6,
                width: width*0.7,
                child: ListView.separated(itemBuilder: (BuildContext context, int index){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/notify.svg',fit: BoxFit.scaleDown,),
                      SizedBox(width: width*0.01,),
                      Expanded(child: Text('The balance has been successfully credited',style: textStyle.copyWith(color: Colors.black,fontSize: 12),textAlign: TextAlign.center,maxLines: 1,)),
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
