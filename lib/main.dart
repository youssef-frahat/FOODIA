import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/router_generation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/dependency_injection.dart';
import 'core/locale/locales.dart';

late final bool isLoggedIn; // متغير عام لتحديد حالة الدخول

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await EasyLocalization.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

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
    final router = RouterGeneration.generateRouter(
      isLoggedIn,
    ); // نمرر حالة الدخول
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
            scaffoldBackgroundColor: const Color(0xFFF8F8F8),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF8F8F8)),
          ),
          routerConfig: router,
        );
      },
    );
  }
}
