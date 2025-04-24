import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/router_generation.dart';

import 'core/locale/locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      startLocale: AppLocales.supportedLocales.first,
      supportedLocales: AppLocales.supportedLocales,
      fallbackLocale: AppLocales.supportedLocales.first,
      path: 'assets/translations',
      child: const Foodia(),
    ),
  );
}


class Foodia extends StatelessWidget {
  const Foodia({super.key});

  @override
  Widget build(BuildContext context) {
    final router = RouterGeneration.goRouter;
    return ScreenUtilInit(
      designSize: const Size(460, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Foodia',
          theme: ThemeData(
            fontFamily: 'Changa',
            scaffoldBackgroundColor: Color(0xFFF8F8F8),
            appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF8F8F8)),
          ),
          routerConfig: router,
        );
      },
    );
  }
}
