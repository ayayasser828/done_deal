import 'package:done_deal/UI/screens/Auth/add_document_screen.dart';
import 'package:done_deal/UI/screens/Auth/add_pass_screen.dart';
import 'package:done_deal/UI/screens/Auth/confirm_screen.dart';
import 'package:done_deal/UI/screens/Auth/login_screen.dart';
import 'package:done_deal/UI/screens/Auth/otp_pass_screen.dart';
import 'package:done_deal/UI/screens/Auth/register_screen.dart';
import 'package:done_deal/UI/screens/Auth/walkthrough_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/nav_bar_bottom.dart';
import 'package:done_deal/UI/screens/confirm_request_screen.dart';
import 'package:done_deal/UI/screens/item_details_screen.dart';
import 'package:done_deal/UI/screens/setting/change_pass_screen.dart';
import 'package:done_deal/UI/screens/setting/chats_screen.dart';
import 'package:done_deal/UI/screens/Nav%20Bar/fav_screen.dart';
import 'package:done_deal/UI/screens/setting/send_contract_screen.dart';
import 'package:done_deal/UI/screens/setting/transaction_screen.dart';
import 'package:done_deal/bussiness%20logic/nav_bar_bottom/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant/strings.dart';

class AppRouter {
  Route? generateRouts(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return MaterialPageRoute(builder: (_) => const WalkThroughScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => OTPPassScreen());
      case addPass:
        return MaterialPageRoute(builder: (_) => const AddPassScreen());
      case addDoc:
        return MaterialPageRoute(builder: (_) => const AddDocScreen());
      case confirm:
        return MaterialPageRoute(builder: (_) => const ConfirmScreen());
      case navBar:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => NavBarCubit(),
              child: const NavBarBottom(),
            ));
      case itemDetails:
        return MaterialPageRoute(builder: (_) => const ItemDetailsScreen());
      case confirmRequest:
        return MaterialPageRoute(builder: (_) => const ConfirmRequestScreen());
      case changePass:
        return MaterialPageRoute(builder: (_) => const ChangePassScreen());
      case sendContract:
        return MaterialPageRoute(builder: (_) => const SendContract());
      case trans:
        return MaterialPageRoute(builder: (_) => const TransactionScren());
      case fav:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatsScreen());
    }
  }
}