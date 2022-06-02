import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../bussiness logic/nav_bar_bottom/nav_bar_cubit.dart';
import '../../../constant/colors.dart';


class NavBarBottom extends StatelessWidget {
  const NavBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
    return BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          NavBarCubit cubit = NavBarCubit.get(context);
          return Scaffold(
            backgroundColor: cubit.currentIndex == 0 || cubit.currentIndex == 1 ? background1 : background2,
            bottomNavigationBar: FloatingNavbar(
              backgroundColor: white,
              width: 85.w,
              items: cubit.bottomItems,
              onTap: cubit.changeBottomNav,
              currentIndex: cubit.currentIndex,
              selectedItemColor: buttonColor,
              unselectedItemColor: grey,
              selectedBackgroundColor: Colors.transparent,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
