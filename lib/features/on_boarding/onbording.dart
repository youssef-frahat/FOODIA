import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/features/on_boarding/onboardingPage.dart';
import 'package:foodia_app/features/on_boarding/onboarding_model.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_config/prefs_keys.dart';
import '../../core/helpers/secure_local_storage.dart';
import '../../core/routing/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      textStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 22,
        color: Colors.black,
      ),
      image: 'assets/images/slide1.png',
      title: Text(
        "اكلتك المفضلة أقرب إليك مما تتخيل!",
        textAlign: TextAlign.center,
      ),
      description: Text(""),
      disStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    OnboardingItem(
      textStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Text color
      ),
      image: "assets/images/slide2.png",
      description: Text(""),
      title: Text(
        ' عالم من الأكلات بين يديك… فقط اطلب واستمتع!',
        textAlign: TextAlign.center,
      ), // "Cook and earn money!" in Arabic
      disStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 24,
        color: Colors.black,
      ), // "Cook and earn money!" in Arabic
    ),
    OnboardingItem(
      textStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Text color
      ),
      image: 'assets/images/slide3.png',
      title: Text(
        'اطلب من الشيف المفضل لديك',
        textAlign: TextAlign.center,
      ), // "Order from your favorite chef!" in Arabic
      description: Text('كل وصفة تبدأ بمكون سري… حب الطبخ!'),
      disStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 16,
        color: const Color.fromARGB(111, 0, 0, 0),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  Future<void> _checkIfLoggedIn() async {
    final token = await SecureLocalStorage.read(PrefsKeys.token);

    if (token != null && token.isNotEmpty) {
      // لو فيه توكن يبقى المستخدم مسجل
      GoRouter.of(context).goNamed(AppRoutes.home);
    } else {
      // لو مفيش توكن يبقى المستخدم مش مسجل
      GoRouter.of(context).goNamed(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E5EC),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(item: _onboardingItems[index]);
            },
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRoutes.login);
              },
              child: Text(
                "تخطي",
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // مؤشر الصفحات
          Positioned(
            bottom: 30,
            left: 20,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingItems.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.orange,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child:
                _currentPage == _onboardingItems.length - 1
                    ? GestureDetector(
                      onTap:
                          () => GoRouter.of(context).goNamed(AppRoutes.login),
                      child: SvgPicture.asset('assets/icons/next.svg'),
                    )
                    : GestureDetector(
                      onTap:
                          () => _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                      child: SvgPicture.asset('assets/icons/next.svg'),
                    ),
          ),
        ],
      ),
    );
  }
}
