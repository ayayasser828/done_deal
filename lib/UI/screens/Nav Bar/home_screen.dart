import 'package:done_deal/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/home_card.dart';
import '../../widgets/text_form_filed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.72,
                    height: height * 0.05,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(17),
                            topLeft: Radius.circular(17),
                            bottomRight: Radius.circular(17))),
                    child: MyTextFormFieldWidget(
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      type: TextInputType.number,
                      hint: 'Search Properties, Area etc ...',
                      icon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      color: white,
                      isPass: false,
                    ),
                  ),
                  Container(
                    width: width * 0.1,
                    height: height * 0.05,
                    decoration: const BoxDecoration(
                        color: textColor, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: SizedBox(
                  height: height * 0.78,
                  width: width,
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return homeCard(context);
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
        ),
      )),
    );
  }
}
