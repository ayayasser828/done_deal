import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_router.dart';

void main() {
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
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRouts,
        );
      }
    );
  }
}
