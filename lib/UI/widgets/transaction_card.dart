import 'package:done_deal/constant/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

Widget transactionCard(BuildContext context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: tr('company_name'),style: textStyle.copyWith(fontSize: 15),),
                TextSpan(text: 'Palm Hills',style: textStyle.copyWith(fontSize: 12),),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: tr('company_com'),style: textStyle.copyWith(fontSize: 15),),
                TextSpan(text: '10 %',style: textStyle.copyWith(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
      Text('10000 Egp',
          style: textStyle2.copyWith(fontSize: 19), textAlign: TextAlign.center),
    ],
  );
}