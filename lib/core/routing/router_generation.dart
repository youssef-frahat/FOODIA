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
      _transition(AppRoutes.home, const HomeScreen()),
      _transition(AppRoutes.bottomNavBar, const BottomNavBar()),
    ],
  );

  static GoRoute _transition(String path, Widget child) {
    return GoRoute(
      path: path,
      name: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedIn = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          );

          final curvedOut = CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInExpo,
          );

          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              final fade = Tween<double>(begin: 0, end: 1).animate(curvedIn);
              final scale = Tween<double>(begin: 0.95, end: 1.0).animate(curvedIn);
              final offset = Tween<Offset>(
                begin: const Offset(0.3, 0.3),
                end: Offset.zero,
              ).animate(curvedIn);

              final rotation = Tween<double>(begin: 0, end: 0.05).animate(curvedOut);
              final fadeOut = Tween<double>(begin: 1, end: 0).animate(curvedOut);

              return Transform(
                transform: Matrix4.identity()
                  ..rotateZ(rotation.value),
                alignment: Alignment.center,
                child: FadeTransition(
                  opacity: animation.status == AnimationStatus.reverse
                      ? fadeOut
                      : fade,
                  child: SlideTransition(
                    position: offset,
                    child: ScaleTransition(
                      scale: scale,
                      child: child,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
