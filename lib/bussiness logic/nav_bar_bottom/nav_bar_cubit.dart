import 'package:done_deal/UI/screens/Nav%20Bar/home_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/notification_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/profile_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/fav_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  static NavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
  ];
  List<FloatingNavbarItem> bottomItems = [
    FloatingNavbarItem(
      icon: Icons.home_filled,
    ),
    FloatingNavbarItem(
      icon: Icons.bookmark,
    ),
    FloatingNavbarItem(
      icon: Icons.person,
    ),
    FloatingNavbarItem(
      icon: Icons.notifications,
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      const HomeScreen();
    } else if (currentIndex == 2) {
      const FavoritesScreen();
    } else if (currentIndex == 3) {
      const ProfileScreen();
    } else if (currentIndex == 4) {
      const NotificationScreen();
    }
    emit(BottomNavState());
  }
}
