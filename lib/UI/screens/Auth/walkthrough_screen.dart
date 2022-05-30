import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:done_deal/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  static final List<String> imgList = [
    'assets/images/walk.svg',
    'assets/images/walk.svg',
    'assets/images/walk.svg',
  ];
  static final List<String> titleList = [
    'Earn a Lot of Money',
    'Earn a Lot of Money',
    'Earn a Lot of Money',
  ];
  static final List<String> textList = [
    'You can make more money through real estate marketing',
    'You can make more money through real estate marketing',
    'You can make more money through real estate marketing',
  ];

  static int index = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: (){
          if(index == 2){
            Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
          }else{
            setState(() {
              index++;
            });
          }
        },

        child: Container(
          width: width*0.1,
          height: height*0.1,
          decoration: const BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
          ),
          child: const Center(child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
        ),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height*0.1,),
            SizedBox(
              width: width,
              height: height*0.3,
              child: SvgPicture.asset(imgList[index]),
            ),
            SizedBox(height: height*0.05,),
            Text(titleList[index],style: textStyle.copyWith(fontSize: 20),),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(textList[index],style: textStyle,textAlign: TextAlign.center),
            ),
            SizedBox(height: height*0.05,),
            SizedBox(
              width: width*0.15,
              height: height*0.07,
                child: ListView.separated(itemBuilder: (BuildContext context, int itemIndex){
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == itemIndex ? textColor : Colors.grey,
                    ),
                  );
                }, separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 10,
                ), itemCount: imgList.length,scrollDirection: Axis.horizontal,)
            ),
          ],
        ),
      )),
    );
  }
}
