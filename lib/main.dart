import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/routing/router_generation.dart';

void main() {
  runApp(Foodia());
}

class Foodia extends StatelessWidget {
  const Foodia({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(460, 926),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGeneration.goRouter,
        );
      },
    );
  }
}
