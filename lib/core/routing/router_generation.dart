import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// screens
import 'package:foodia_app/features/on_boarding/on_boarding1.dart';
import 'package:foodia_app/core/witgets/bottom_navigation_bar/custom_button_nav_bar.dart';
import 'package:foodia_app/features/home/presentation/screens/home_screen.dart';
import 'app_routes.dart';

class RouterGeneration {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBordingScreen,
    routes: [
      _transition(AppRoutes.onBordingScreen, const OnBoarding1()),
      
      // _transition(AppRoutes.forgetpassword, const ForgetPasswordScreen()),
      // _transition(AppRoutes.newpassword, const NewPasswordScreen()),
      // _transition(AppRoutes.sucesspassword, const SuccessPasswordScreen()),
      // _transition(AppRoutes.verifyotp, const VerifyOtpScreen()),
      _transition(AppRoutes.home, const HomeScreen()),

      // BottomNavBar with slide from bottom
      GoRoute(
        path: AppRoutes.bottomNavBar,
        name: AppRoutes.bottomNavBar,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BottomNavBar(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      ),
    ],
  );

  /// 🔁 Custom transition for all normal pages (Slide from right + fade)
  static GoRoute _transition(String path, Widget child) {
    return GoRoute(
      path: path,
      name: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
