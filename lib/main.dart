import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/router_generation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'features/wallet/presentation/logic/cubit/get_balance_cubit.dart';

late final bool isLoggedIn;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  runApp(
    const Directionality(
      textDirection: TextDirection.rtl,
      child: Foodia(),
    ),
  );
}

class Foodia extends StatelessWidget {
  const Foodia({super.key});

  @override
  Widget build(BuildContext context) {
    final router = RouterGeneration.generateRouter();

    return ScreenUtilInit(
      designSize: const Size(460, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider<GetBalanceCubit>(
          create: (context) => getIt<GetBalanceCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Foodia',
            theme: ThemeData(
              fontFamily: 'Changa',
              scaffoldBackgroundColor: const Color(0xFFF8F8F8),
              appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF8F8F8)),
            ),
            locale: const Locale('ar'), 
            routerConfig: router,
          ),
        );
      },
    );
  }
}
