import 'package:done_deal/UI/widgets/transaction_card.dart';
import 'package:done_deal/constant/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/style.dart';
import '../../../utils/get_lang.dart';

class TransactionScren extends StatelessWidget {
  const TransactionScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(width: GetLAng.lang == 'en_US'
                      ? 10.w : 6.w,),
                  SizedBox(
                    width: 50.w,
                    height: 12.h,
                    child: Image.asset(
                      'assets/images/Logo 01.png',
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                tr('trans'),
                style: textStyle.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: 85.w,
                height: 70.h,
                child: Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              transactionCard(context),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                width: 75.w,
                                height: 0.1.h,
                                color: buttonColor,
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        scrollDirection: Axis.vertical,
                        itemCount: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
