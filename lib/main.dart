import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routes/app_router.dart';

void main() {
  // The Foodia widget is the root of the application.
  runApp(Foodia());
}

class Foodia extends StatelessWidget {
  const Foodia({super.key});

  // The Foodia widget serves as the root of the application.
  // It initializes the screen size configuration using ScreenUtilInit
  // and sets up the MaterialApp with a router configuration.
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    return ScreenUtilInit(
      designSize: const Size(460, 926),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
