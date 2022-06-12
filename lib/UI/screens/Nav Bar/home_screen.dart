import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../bussiness logic/general/general_cubit.dart';
import '../../widgets/drop_down.dart';
import '../../widgets/home_card.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_form_filed.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static final List<String> genderList = [
    tr('male'),
    tr('female'),
  ];

  String? selectedGender;

  List<String> items = ['Lowest', 'Highest'];

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
              height: height * 0.72,
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
                                    tr('filter'),
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
                                    tr('area'),
                                    style: textStyle,
                                  ),
                                  SizedBox(
                                    width: width * 0.48,
                                  ),
                                  Container(
                                    width: 30.w,
                                    decoration: const BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            topLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)
                                        )
                                    ),
                                    child: SimpleDropDown<String>(
                                      isRequired: true,
                                      list: genderList.isEmpty ? [] : genderList,
                                      onChanged: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      onSaved: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      value: selectedGender,
                                      title: 'Gender',
                                      validator: (city) => city != null
                                          ? null
                                          : 'Select Gender',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text(
                                tr('Price'),
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
                                height: height * 0.01,
                              ),
                              Text(
                                tr('Space'),
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
                                        .currentRangeValues2,
                                    min: 10,
                                    max: 1000,
                                    divisions: 100,
                                    labels: RangeLabels(
                                      BlocProvider.of<GeneralCubit>(context)
                                          .currentRangeValues2
                                          .start
                                          .round()
                                          .toString(),
                                      BlocProvider.of<GeneralCubit>(context)
                                          .currentRangeValues2
                                          .end
                                          .round()
                                          .toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      BlocProvider.of<GeneralCubit>(context)
                                          .rangeSlider2(values);
                                    }),
                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    tr('Room'),
                                    style: textStyle,
                                  ),
                                  Text(
                                    tr('Bath'),
                                    style: textStyle,
                                  ),
                                  Text(
                                    tr('Balacon'),
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 28.w,
                                    decoration: const BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            topLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)
                                        )
                                    ),
                                    child: SimpleDropDown<String>(
                                      isRequired: true,
                                      list: genderList.isEmpty ? [] : genderList,
                                      onChanged: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      onSaved: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      value: selectedGender,
                                      title: 'Gender',
                                      validator: (city) => city != null
                                          ? null
                                          : 'Select Gender',
                                    ),
                                  ),
                                  Container(
                                    width: 28.w,
                                    decoration: const BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            topLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)
                                        )
                                    ),
                                    child: SimpleDropDown<String>(
                                      isRequired: true,
                                      list: genderList.isEmpty ? [] : genderList,
                                      onChanged: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      onSaved: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      value: selectedGender,
                                      title: 'Gender',
                                      validator: (city) => city != null
                                          ? null
                                          : 'Select Gender',
                                    ),
                                  ),
                                  Container(
                                    width: 28.w,
                                    decoration: const BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                            topLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(17)
                                        )
                                    ),
                                    child: SimpleDropDown<String>(
                                      isRequired: true,
                                      list: genderList.isEmpty ? [] : genderList,
                                      onChanged: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      onSaved: (gender) {
                                        setState(() {
                                          selectedGender = gender;
                                        });
                                      },
                                      value: selectedGender,
                                      title: 'Gender',
                                      validator: (city) => city != null
                                          ? null
                                          : 'Select Gender',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h,),
                              Center(
                                child: MyButtonWidget(
                                    btnTxt: tr('search_now'),
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
