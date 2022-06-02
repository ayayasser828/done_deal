import 'package:done_deal/constant/colors.dart';
import 'package:done_deal/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'app_router.dart';
import 'constant/global_variables.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/lang',
      fallbackLocale: const Locale('en','US'),
      saveLocale: true,
      startLocale: const Locale('en','US'),
      child: MyApp(
    appRouter: AppRouter(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder:(context, orientation, deviceType) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Flutter Demo',
          theme: _buildTheme(Brightness.light),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRouts,
          //initialRoute: initScreen == 0 || initScreen == null ? start : splash,
        );
      }
    );
  }
}
ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.amiriTextTheme(baseTheme.textTheme),
  );
}
