import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/home/presentation/logic/special_offer/cubit/special_offer_cubit.dart';
import '../app_config/image_urls.dart';
import '../di/dependency_injection.dart';

class SpecialOfferSlider extends StatefulWidget {
  const SpecialOfferSlider({super.key});

  @override
  State<SpecialOfferSlider> createState() => _SpecialOfferSliderState();
}

class _SpecialOfferSliderState extends State<SpecialOfferSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;
  int _offerLength = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients && mounted && _offerLength > 0) {
        if (_currentPage >= _offerLength) {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        _currentPage++;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SpecialOfferCubit>()..getSpecialOffers(),
      child: BlocBuilder<SpecialOfferCubit, SpecialOfferState>(
        builder: (context, state) {
          if (state is SpecialOfferLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SpecialOfferError) {
            return Center(child: Text(state.message));
          }

          if (state is SpecialOfferLoaded) {
            final offers = state.offers.data?.data ?? [];

            _offerLength = offers.length;
            if (_currentPage >= offers.length) _currentPage = 0;

            return Column(
              children: [
                SizedBox(
                  height: 160.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      final offer = offers[index];
                     return AnimatedBuilder(
  animation: _pageController,
  builder: (context, child) {
    double scale = 1.0;
    if (_pageController.hasClients && _pageController.position.haveDimensions) {
      double diff = (_pageController.page ?? _currentPage).toDouble() - index.toDouble();
      scale = (1 - (diff.abs() * 0.1)).clamp(0.9, 1.0).toDouble();
    }

    return Transform.scale(
      scale: scale,
      child: child,
    );
  },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.asset(
                                  'assets/images/banner.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: REdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 75.r,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                            "$imageUrl${offer.image}",
                                          ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 200.w,
                                              maxHeight: 100.h,
                                            ),
                                            child: Text(
                                              offer.name ?? '',
                                              style: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'Changa',
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Row(
                                            children: [
                                              Text(
                                                "ج.م ${offer.offerPrice}",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                "ج.م ${offer.price}",
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: offers.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    dotColor: Colors.orange.withOpacity(0.4),
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    spacing: 6.w,
                    expansionFactor: 2,
                  ),
                ),
              ],
            );
          }

          return const SizedBox(); // fallback
        },
      ),
    );
  }
}
