import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/style.dart';
import '../../widgets/home_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
              Text(tr('fav'),style: textStyle.copyWith(fontSize: 20.sp),),
              SizedBox(height: 1.5.h,),
              Center(
                child: SizedBox(
                  height: 73.h,
                  width: width,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return HomeCard();
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: 5),
                ),
              ),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      )),
    );
  }
}
