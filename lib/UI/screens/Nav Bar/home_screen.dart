import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../bussiness logic/general/general_cubit.dart';
import '../../widgets/home_card.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filter = [
    'TOPS',
    'DRESSES',
    'PANTS',
    'SHOES',
    'TSHIRTS',
    'TOPS',
  ];

  List<String> items = ['Lowest', 'Highest'];

  List<String> textList = [
    'Nike',
    'Adidas',
    'Poebah',
    'Bata',
    'Ardira',
    'Kompak'
  ];

  List<Color> color = [
    textColor,
    Colors.black,
    Colors.grey,
    Colors.green,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 72.w,
                    height: 5.h,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(17),
                            topLeft: Radius.circular(17),
                            bottomRight: Radius.circular(17))),
                    child: MyTextFormFieldWidget(
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      type: TextInputType.name,
                      hint: tr('search'),
                      icon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      color: white,
                      isPass: false,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      return modalBottomSheetMenu(context);
                    },
                    child: Container(
                      width: 10.w,
                      height: 5.h,
                      decoration: const BoxDecoration(
                          color: textColor, shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
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
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      )),
    );
  }

  void modalBottomSheetMenu(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return BlocProvider(
            create: (context) => GeneralCubit(),
            child: Container(
              height: height * 0.7,
              color: Colors.transparent,
              child: BlocConsumer<GeneralCubit, GeneralState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                      height: height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0))),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width * 0.4,
                                  ),
                                  Text(
                                    'Filter',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sort By',
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: width * 0.4,
                                  ),
                                  Container(
                                    width: width * 0.33,
                                    height: height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: textColor
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: DropdownButton(
                                        value: BlocProvider.of<GeneralCubit>(
                                            context)
                                            .dropDownValue,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: textColor,
                                          size: 30,
                                        ),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: textStyle,
                                              ));
                                        }).toList(),
                                        onChanged: (String? v) {
                                          BlocProvider.of<GeneralCubit>(context)
                                              .dropDown(v!);
                                        },
                                        elevation: 0,
                                        underline: const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text(
                                'Price',
                                style: textStyle,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: textColor,
                                  disabledActiveTrackColor: Colors.grey,
                                  inactiveTrackColor: Colors.grey,
                                  valueIndicatorColor: Colors.transparent,
                                  valueIndicatorTextStyle: textStyle,
                                  trackShape:
                                  const RectangularSliderTrackShape(),
                                  trackHeight: 1.0,
                                  thumbColor: Colors.white,
                                  disabledThumbColor: textColor,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 100.0,
                                  ),
                                ),
                                child: RangeSlider(
                                    values:
                                    BlocProvider.of<GeneralCubit>(context)
                                        .currentRangeValues,
                                    min: 10,
                                    max: 1000,
                                    divisions: 100,
                                    labels: RangeLabels(
                                      BlocProvider.of<GeneralCubit>(context)
                                          .currentRangeValues
                                          .start
                                          .round()
                                          .toString(),
                                      BlocProvider.of<GeneralCubit>(context)
                                          .currentRangeValues
                                          .end
                                          .round()
                                          .toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      BlocProvider.of<GeneralCubit>(context)
                                          .rangeSlider(values);
                                    }),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text(
                                'Brand',
                                style: textStyle,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              SizedBox(
                                  width: width,
                                  height: height * 0.06,
                                  child: ListView.separated(
                                    itemCount:
                                    BlocProvider.of<GeneralCubit>(context)
                                        .isSelected
                                        .length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          BlocProvider.of<GeneralCubit>(context)
                                              .selectedItem(index);
                                        },
                                        child: Container(
                                          width: width * 0.15,
                                          height: height * 0.02,
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border.all(
                                                color: BlocProvider.of<
                                                    GeneralCubit>(
                                                    context)
                                                    .isSelected[index]
                                                    ? textColor
                                                    : Colors.grey,
                                                width: 1),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              textList[index],
                                              style: textStyle.copyWith(
                                                  color: BlocProvider.of<
                                                      GeneralCubit>(
                                                      context)
                                                      .isSelected[index]
                                                      ? Colors.black
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 10,
                                    ),
                                    shrinkWrap: true,
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text(
                                'Color',
                                style: textStyle,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              SizedBox(
                                  width: width,
                                  height: height * 0.05,
                                  child: ListView.separated(
                                    itemCount:
                                    BlocProvider.of<GeneralCubit>(context)
                                        .colorSelected
                                        .length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          BlocProvider.of<GeneralCubit>(context)
                                              .selectedColor(index);
                                        },
                                        child: Container(
                                          width: width * 0.1,
                                          height: height * 0.05,
                                          decoration: BoxDecoration(
                                            color: color[index],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: BlocProvider.of<
                                                    GeneralCubit>(
                                                    context)
                                                    .colorSelected[index]
                                                    ? Colors.black
                                                    : Colors.transparent,
                                                width: 3),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: 20,
                                    ),
                                    shrinkWrap: true,
                                  )),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Center(
                                child: MyButtonWidget(
                                    btnTxt: tr('filter'),
                                    btnWidth: 78.w,
                                    btnHeight: 5.h,
                                    onPressed: () {},
                                    color: textColor,
                                    borderColor: textColor,
                                    weight: FontWeight.w600,
                                    textSize: 15.sp,
                                    textColor: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          );
        });
  }
}
