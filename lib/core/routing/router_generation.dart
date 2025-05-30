import 'package:flutter/material.dart';

import 'package:foodia_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:foodia_app/core/witgets/bottom_navigation_bar/custom_button_nav_bar.dart';
import 'package:foodia_app/features/home/presentation/screens/home_screen.dart';
import 'package:foodia_app/features/auth/forgotPassword/presentation/screen/forgotPassword_screen.dart';
import 'package:foodia_app/features/auth/login/presentation/screen/login_screen.dart';
import 'package:foodia_app/features/auth/otp/presentation/screen/otp_screen.dart';
import 'package:foodia_app/features/auth/signin/presentation/screens/signin_screen.dart';
import 'package:foodia_app/features/on_boarding/onbording.dart';
import 'package:foodia_app/features/profile/presentation/screen/edit_profile_screen.dart';
import 'package:foodia_app/features/profile/presentation/screen/profile_screen.dart';

import '../../features/address/presentation/screen/address_selection_screen.dart';
import '../../features/address/presentation/screen/payment.dart';
import '../../features/address/presentation/widget/order_details.dart';
import '../../features/auth/forgotPassword/presentation/screen/otp_reset_password_screen.dart';
import '../../features/auth/forgotPassword/presentation/widget/forgot_passowrd_chenge.dart';
import '../../features/followers/presentation/screen/followers_details_chfa.dart';
import '../../features/followers/presentation/screen/followers_screen.dart';
import '../../features/home/presentation/screens/details_screen.dart';
import '../../features/order/presentation/screen/order_screen.dart';
import '../../features/wallet/presentation/screens/wallet_screen.dart';
import 'app_routes.dart';

class RouterGeneration {
  static GoRouter generateRouter() {
    return GoRouter(
      initialLocation: AppRoutes.onboarding,
      routes: [
        GoRoute(
          path: AppRoutes.onboarding,
          name: AppRoutes.onboarding,
          pageBuilder: _transitionBuilder((_, __) => const OnboardingScreen()),
        ),
        GoRoute(
          path: AppRoutes.cartScreen,
          name: AppRoutes.cartScreen,
          pageBuilder: _transitionBuilder((_, __) => const CartScreen()),
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
          path: AppRoutes.forgotPasswordOtp,
          name: AppRoutes.forgotPasswordOtp,
          pageBuilder: (context, state) {
            final phoneNumber = state.extra;
            if (phoneNumber is! String || phoneNumber.isEmpty) {
              return _errorPage("Phone number is missing");
            }
            return _buildTransitionPage(
              OtpResetPasswordScreen(phoneNumber: phoneNumber),
              state,
            );
          },
        ),
        GoRoute(
          path: AppRoutes.forgotPasswordChange,
          name: AppRoutes.forgotPasswordChange,
          pageBuilder: (context, state) {
            final phoneNumber = state.extra;
            if (phoneNumber is! String || phoneNumber.isEmpty) {
              return _errorPage("Phone number is missing");
            }
            return _buildTransitionPage(
              ForgotPassowrdChenge(phoneNumber: phoneNumber),
              state,
            );
          },
        ),
        GoRoute(
          name: AppRoutes.detailsScreen,
          path: AppRoutes.detailsScreen,
          builder: (context, state) {
            final foodId = state.extra as int;
            return ProductDetailsScreen(foodId: foodId);
          },
        ),

        // GoRoute(
        //   name: AppRoutes.searchResultScreen,
        //   path: AppRoutes.searchResultScreen,
        //   builder: (context, state) {
        //     final data = state.extra as Map<String, dynamic>;
        //     final String query = data['query'] as String;
        //     final List<FoodsModel> foods = data['foods'] as List<FoodsModel>;

        //     return SearchResultScreen(searchQuery: query, allFoods: foods);
        //   },
        // ),
        GoRoute(
          name: AppRoutes.followDetails,
          path: AppRoutes.followDetails,
          builder: (context, state) {
            final chefeId = state.extra as int;
            return ChefProfileScreen(cefeId: chefeId);
          },
        ),
        GoRoute(
          name: AppRoutes.addressSelectionScreen,
          path: AppRoutes.addressSelectionScreen,
          builder: (context, state) {
            return AddressSelectionScreen();
          },
        ),
        GoRoute(
          name: AppRoutes.orderDetails,
          path: AppRoutes.orderDetails,
          builder: (context, state) {
            final addressId = state.extra as int;
            return OrderDetails(addressId: addressId);
          },
        ),
        GoRoute(
          name: AppRoutes.payment,
          path: AppRoutes.payment,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return PaymentScreen(
              total: data['total'] as int,
              orderId: data['id'] as int,
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

        ShellRoute(
          builder: (context, state, child) {
            return BottomNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: AppRoutes.home,
              pageBuilder: _transitionBuilder((_, __) => const HomeScreen()),
            ),
            GoRoute(
              path: AppRoutes.follow,
              name: AppRoutes.follow,
              pageBuilder: _transitionBuilder(
                (_, __) => const FollowersScreen(),
              ),
            ),
            GoRoute(
              path: AppRoutes.orderScreen,
              name: AppRoutes.orderScreen,
              pageBuilder: _transitionBuilder((_, __) => const OrderScreen()),
            ),
            GoRoute(
              path: AppRoutes.wallet,
              name: AppRoutes.wallet,
              pageBuilder: _transitionBuilder((_, __) => const WalletScreen()),
            ),
            GoRoute(
              path: AppRoutes.profileScreen,
              name: AppRoutes.profileScreen,
              pageBuilder: _transitionBuilder((_, __) => const ProfileScreen()),
            ),
            // GoRoute(
            //   name: AppRoutes.detailsScreen,
            //   path: AppRoutes.detailsScreen,
            //   builder: (context, state) {
            //     final foodId = state.extra as int;
            //     return ProductDetailsScreen(foodId: foodId);
            //   },
            // ),
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
          ],
        ),
      ],
    );
  }

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
