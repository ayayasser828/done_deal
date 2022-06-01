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
            backgroundColor: white,
            floatingActionButton: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 90.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: grey,
                  gradient: navBarGradient,
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: grey,
                  items: cubit.bottomItems,
                  onTap: cubit.changeBottomNav,
                  currentIndex: cubit.currentIndex,
                  selectedItemColor: buttonColor,
                  unselectedItemColor: grey,
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
