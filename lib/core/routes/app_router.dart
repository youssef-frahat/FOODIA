import 'package:flutter/material.dart';
import 'package:foodia_app/core/routes/routes.dart';
import 'package:foodia_app/core/routes/screen_withfade_transition.dart';
import 'package:foodia_app/feature/auth/presentation/screens/register_screen.dart';
import 'package:foodia_app/feature/on_boarding/onbording.dart';
import 'package:foodia_app/home.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/presentation/widget/second_register_body.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();

  final GoRouter router;

  AppRouter()
    : router = GoRouter(
        navigatorKey: appNavigatorKey,
        initialLocation: Routes.onboardingScreen,
        routes: <RouteBase>[
          // GoRoute(
          //   parentNavigatorKey: appNavigatorKey,
          //   path: Routes.login,
          //   name: Routes.login,
          //   pageBuilder: (context, GoRouterState state) =>
          //       screenWithFadeTransition(
          //     context: context,
          //     state: state,
          //     child: const LoginScreen(),
          //   ),
          // ),
          GoRoute(
            parentNavigatorKey: appNavigatorKey,
            path: Routes.onboardingScreen,
            name: Routes.onboardingScreen,
            pageBuilder:
                (context, GoRouterState state) => screenWithFadeTransition(
                  context: context,
                  state: state,
                  child: const OnboardingScreen(),
                ),
          ),
          GoRoute(
            parentNavigatorKey: appNavigatorKey,
            path: Routes.registerScreen,
            name: Routes.registerScreen,
            pageBuilder:
                (context, GoRouterState state) => screenWithFadeTransition(
                  context: context,
                  state: state,
                  child: const RegisterScreen(),
                ),
          ),
          GoRoute(
            parentNavigatorKey: appNavigatorKey,
            path: Routes.register2Screen,
            name: Routes.register2Screen,
            pageBuilder:
                (context, GoRouterState state) => screenWithFadeTransition(
                  context: context,
                  state: state,
                  child: const SecondPage(),
                ),
          ),
          GoRoute(
            parentNavigatorKey: appNavigatorKey,
            path: Routes.home,
            name: Routes.home,
            pageBuilder:
                (context, GoRouterState state) => screenWithFadeTransition(
                  context: context,
                  state: state,
                  child: const Home(),
                ),
          ),
        ],
      );
}
