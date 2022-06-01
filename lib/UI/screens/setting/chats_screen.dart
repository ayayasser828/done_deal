import 'package:done_deal/UI/widgets/chat_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/style.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(width: 10.w,),
                SizedBox(
                  width: 50.w,
                  height: 12.h,
                  child: Image.asset('assets/images/Logo 01.png',fit: BoxFit.scaleDown,),
                )
              ],
            ),
            SizedBox(height: 2.h,),
            Text(tr('chat'),style: textStyle.copyWith(fontSize: 20.sp),),
            SizedBox(height: 2.h,),
            Center(
              child: SizedBox(
                height: 75.h,
                width: 85.w,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return chatCard(context);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 30,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: 5),
              ),
            )
          ],
        ),
      )),
    );
  }
}
