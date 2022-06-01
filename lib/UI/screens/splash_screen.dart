import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:done_deal/UI/screens/Auth/login_screen.dart';
import 'package:done_deal/constant/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 1000,
        splash: Image.asset('assets/images/Logo 01.png'),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.scaleTransition,
        //pageTransitionType: PageTransitionType.scale,
        backgroundColor: background1);
  }
}

