import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_config/app_icons.dart';
import '../../../features/home/presentation/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
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
            final isSelected = index == _selectedIndex;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    item['icon']!,
                    width: isSelected ? 24 : 24,
                    height: isSelected ? 24 : 24,
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
                  // Indicator bar
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
    {'icon': AppIcons.approved, 'label': 'اتابعة'},
    {'icon': AppIcons.cart, 'label': 'طلباتي'},
    {'icon': AppIcons.wallet, 'label': 'المحفظة'},
    {'icon': AppIcons.profile, 'label': 'حسابي'},
  ];
}
