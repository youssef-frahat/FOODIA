import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app_config/app_icons.dart';
import '../../routing/app_routes.dart';

class BottomNavBar extends StatelessWidget {
  final Widget child;
  const BottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();


    int getCurrentIndex() {
      if (location.startsWith(AppRoutes.home)) return 0;
      if (location.startsWith('/follow')) return 1;
      if (location.startsWith('/orders')) return 2;
      if (location.startsWith('/wallet')) return 3;
      if (location.startsWith(AppRoutes.profileScreen)) return 4;
      return 0;
    }

    void onItemTapped(int index) {
      switch (index) {
        case 0:
          context.go(AppRoutes.home);
          break;
        case 1:
          context.go('/follow'); 
          break;
        case 2:
          context.go('/orders'); 
          break;
        case 3:
          context.go('/wallet'); 
          break;
        case 4:
          context.go(AppRoutes.profileScreen);
          break;
      }
    }

    final currentIndex = getCurrentIndex();

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E1E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            final item = _navItems[index];
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    item['icon']!,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected ? Colors.orange : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['label']!,
                    style: TextStyle(
                      color: isSelected ? Colors.orange : Colors.grey,
                      fontSize: isSelected ? 14.sp : 12.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3,
                    width: isSelected ? 24 : 0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  List<Map<String, String>> get _navItems => [
        {'icon': AppIcons.home, 'label': 'الرئيسية'},
        {'icon': AppIcons.approved, 'label': 'المتابعة'},
        {'icon': AppIcons.cart, 'label': 'طلباتي'},
        {'icon': AppIcons.wallet, 'label': 'المحفظة'},
        {'icon': AppIcons.profile, 'label': 'حسابي'},
      ];
}
