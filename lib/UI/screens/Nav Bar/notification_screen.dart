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
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10.h, bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                topLeft: Radius.circular(17),
                bottomRight: Radius.circular(17)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/profile.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(tr('notify'),
                      style: textStyle.copyWith(color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
              SizedBox(
                height: 68.h,
                width: 70.w,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/notify.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                              child: Text(
                            'The balance has been successfully credited',
                            style: textStyle.copyWith(
                                color: Colors.black, fontSize: 11.sp),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                            BoxConstraints constraints) {
                          final boxWidth = constraints.constrainWidth();
                          const dashWidth = 10.0;
                          final dashCount =
                          (boxWidth / (2 * dashWidth)).floor();
                          return Flex(
                            children: List.generate(dashCount, (_) {
                              return SizedBox(
                                width: dashWidth,
                                height: 1,
                                child: DecoratedBox(
                                  decoration:
                                  BoxDecoration(color: grey),
                                ),
                              );
                            }),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                          );
                        },
                      ),
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
