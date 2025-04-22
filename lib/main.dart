import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/router_generation.dart';

void main() {
  // The Foodia widget is the root of the application.
  runApp(Foodia());
}

class Foodia extends StatelessWidget {
  const Foodia({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    return ScreenUtilInit(
      designSize: const Size(460, 926),
      minTextAdapt: true,
      
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
