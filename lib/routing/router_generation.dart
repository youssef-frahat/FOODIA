import 'package:foodia_app/auth/screens/forget_password.dart';
import 'package:foodia_app/auth/screens/log_in.dart';
import 'package:foodia_app/auth/screens/new_pass.dart';
import 'package:foodia_app/on_boarding/on_boarding1.dart';
import 'package:foodia_app/auth/screens/register_screen.dart';
import 'package:foodia_app/auth/screens/sucess_pass.dart';
import 'package:foodia_app/auth/screens/verify_otp_page.dart';
import 'package:foodia_app/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBordingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBordingScreen,
        name: AppRoutes.onBordingScreen,
        builder: (context, State) => const OnBoarding1(),
      ),
      GoRoute(
        path: AppRoutes.signinScreen,
        name: AppRoutes.signinScreen,
        builder: (context, State) => Registerpage(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, State) => LogIn(),
      ),

      GoRoute(
        path: AppRoutes.forgetpassword,
        name: AppRoutes.forgetpassword,
        builder: (context, State) => ForgetPassword(),
      ),
      GoRoute(
        path: AppRoutes.newpassword,
        name: AppRoutes.newpassword,
        builder: (context, State) => NewPass(),
      ),
      GoRoute(
        path: AppRoutes.sucesspassword,
        name: AppRoutes.sucesspassword,
        builder: (context, State) => SucessPass(),
      ),
      GoRoute(
        path: AppRoutes.verifyotp,
        name: AppRoutes.verifyotp,
        builder: (context, State) => Verifyotp(),
      ),

    ],
  );
}
