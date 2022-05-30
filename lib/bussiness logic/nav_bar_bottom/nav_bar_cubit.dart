import 'package:done_deal/UI/screens/Nav%20Bar/home_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/notification_screen.dart';
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
    const HomeScreen(),
    const HomeScreen(),
    const NotificationScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: '',
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      const HomeScreen();
    } else if (currentIndex == 2) {
      const HomeScreen();
    } else if (currentIndex == 3) {
      const HomeScreen();
    } else if (currentIndex == 4) {
      const NotificationScreen();
    }
    emit(BottomNavState());
  }
}
