import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// screens
import 'package:foodia_app/features/on_boarding/on_boarding1.dart';
import 'package:foodia_app/core/witgets/bottom_navigation_bar/custom_button_nav_bar.dart';
import 'package:foodia_app/features/home/presentation/screens/home_screen.dart';

import '../../features/auth/forgotPassword/presentation/screen/forgotPassword_screen.dart';
import '../../features/auth/login/presentation/screen/login_screen.dart';
import '../../features/auth/otp/presentation/screen/otp_screen.dart';
import '../../features/auth/signin/presentation/screens/signin_screen.dart';
import '../../features/profile/presentation/screen/edit_profile_screen.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import 'app_routes.dart';

class RouterGeneration {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBordingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBordingScreen,
        name: AppRoutes.onBordingScreen,
        pageBuilder: _transitionBuilder((_, __) => const OnBoarding1()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: _transitionBuilder((_, __) => const LoginScreen()),
      ),
      GoRoute(
        path: AppRoutes.signinScreen,
        name: AppRoutes.signinScreen,
        pageBuilder: _transitionBuilder((_, __) => const SigninScreen()),
      ),
      GoRoute(
        path: AppRoutes.otpScreen,
        name: AppRoutes.otpScreen,
        pageBuilder: (context, state) {
          final phoneNumber = state.extra;
          if (phoneNumber is! String || phoneNumber.isEmpty) {
            return _errorPage("Phone number is missing");
          }
          return _buildTransitionPage(
            OtpScreen(phoneNumber: phoneNumber),
            state,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgetpassword,
        name: AppRoutes.forgetpassword,
        pageBuilder: (context, state) {
          return _buildTransitionPage(ForgotpasswordScreen(), state);
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: _transitionBuilder((_, __) => const HomeScreen()),
      ),
      GoRoute(
        path: AppRoutes.profileScreen,
        name: AppRoutes.profileScreen,
        pageBuilder: _transitionBuilder((_, __) => const ProfileScreen()),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        name: AppRoutes.editProfileScreen,
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          return _buildTransitionPage(
            EditProfileScreen(
              name: data?['name'] ?? '',
              email: data?['email'] ?? '',
              phone: data?['phone'] ?? '',
              image: data?['image'] ?? '',
            ),
            state,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.bottomNavBar,
        name: AppRoutes.bottomNavBar,
        pageBuilder: _transitionBuilder((_, __) => const BottomNavBar()),
      ),
    ],
  );

  static GoRouterPageBuilder _transitionBuilder(
    Widget Function(BuildContext, GoRouterState) builder,
  ) {
    return (context, state) {
      final child = builder(context, state);
      return _buildTransitionPage(child, state);
    };
  }

  static CustomTransitionPage _buildTransitionPage(
    Widget child,
    GoRouterState state,
  ) {
    return CustomTransitionPage(
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

        final fade = Tween<double>(begin: 0, end: 1).animate(curvedIn);
        final scale = Tween<double>(begin: 0.95, end: 1.0).animate(curvedIn);
        final offset = Tween<Offset>(
          begin: const Offset(0.3, 0.3),
          end: Offset.zero,
        ).animate(curvedIn);
        final rotation = Tween<double>(begin: 0, end: 0.05).animate(curvedOut);
        final fadeOut = Tween<double>(begin: 1, end: 0).animate(curvedOut);

        return Transform(
          transform: Matrix4.identity()..rotateZ(rotation.value),
          alignment: Alignment.center,
          child: FadeTransition(
            opacity:
                animation.status == AnimationStatus.reverse ? fadeOut : fade,
            child: SlideTransition(
              position: offset,
              child: ScaleTransition(scale: scale, child: child),
            ),
          ),
        );
      },
    );
  }

  static CustomTransitionPage _errorPage(String message) {
    return CustomTransitionPage(
      child: Scaffold(
        body: Center(
          child: Text(message, style: const TextStyle(color: Colors.red)),
        ),
      ),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) => child,
    );
  }
}
