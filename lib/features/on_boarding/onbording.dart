import 'package:flutter/material.dart';
import 'package:foodia_app/features/on_boarding/onboardingPage.dart';
import 'package:foodia_app/features/on_boarding/onboarding_model.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/routing/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Step 3: Create a PageController to manage the onboarding pages
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current page index

  // Step 4: Define your onboarding content (titles, descriptions, and images)
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      textStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 22,

        color: Colors.black, // Text color
      ),
      image: 'assets/images/slide1.png',
      title: Text(
        "اكلتك المفضلة أقرب إليك مما تتخيل!",
        textAlign: TextAlign.center,
      ), // "Welcome to Foodia!" in Arabic
      description: Text(""),
      disStyle: TextStyle(
        fontFamily: 'Changa',
        fontSize: 22,
        color: Colors.white, // Text color
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E5EC), // Background color
      body: Stack(
        children: [
          // Step 6: Add a PageView for swipeable onboarding screens
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index; // Update the current page index
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(item: _onboardingItems[index]);
            },
          ),

          // Skip button in the upper right corner
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(AppRoutes.login);
              },
              child: Text(
                "تخطي", // "Skip" in Arabic
                style: TextStyle(
                  fontFamily: 'Changa', // Use Changa font
                  fontSize: 16,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),

          // Smooth Page Indicator
          Positioned(
            bottom: 30, // Adjust the distance from the bottom
            left: 20, // Adjust the distance from the left
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingItems.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white, // Active dot color
                dotColor: Colors.orange, // Inactive dot color
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8, // Space between dots
              ),
            ),
          ),

          // Next button with only ">" sign
          Positioned(
            bottom: 20,
            right: 20,
            child:
                _currentPage == _onboardingItems.length - 1
                    ? ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xFFFFA500,
                        ), // Button color (#FFA500)
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ), // Rounded corners
                      ),

                      child: Text(
                        "ابدأ الآن", // "Get Started" in Arabic
                        style: TextStyle(
                          fontFamily: 'Changa', // Use Changa font
                          fontSize: 16,
                          color: Colors.white, // Text color
                        ),
                      ),
                    )
                    : ElevatedButton(
                      onPressed: () {
                        // Go to the next page
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xFFFFA500,
                        ), // Button color (#FFA500)
                        padding: EdgeInsets.all(
                          20,
                        ), // Adjust padding for the ">" sign
                        // Make the button circular
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "التالي",
                        style: TextStyle(
                          fontFamily: 'Changa', // Use Changa font
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Text color
                        ),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
