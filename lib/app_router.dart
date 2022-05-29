import 'package:done_deal/UI/screens/login_screen.dart';
import 'package:done_deal/UI/screens/register_screen.dart';
import 'package:done_deal/UI/screens/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'constant/strings.dart';

class AppRouter{
  Route? generateRouts(RouteSettings settings){
    switch (settings.name){
      case start:
        return MaterialPageRoute(builder: (_) => const WalkThroughScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
    }
  }
}