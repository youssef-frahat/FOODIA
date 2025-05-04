import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/extensions/spacing.dart';

class AddressCardWidget extends StatelessWidget {
  final String city;
  final String address;
  final bool selected;

  const AddressCardWidget({
    super.key,
    required this.city,
    required this.address,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 400.w,
      child: Card(
        margin: REdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        selected ? Icons.radio_button_checked : Icons.radio_button_off,
                        color: selected ? Colors.orange : Colors.grey,
                        size: 30,
                      ),
                      horizontalSpace(12),
                      CircleAvatar(
                        radius: 25.r,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text(
                          city,
                          style: TextStyle(
                            color: Color(0xFF32343E),
                            fontSize: 14.sp,
                            fontFamily: 'Changa'
                          ),
                        ),
                        verticalSpace(16),
                        Text(
                          address,
                          style: TextStyle(
                            color: Color(0xFF32343E),
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                Positioned(
                bottom: 40.h,
                left: 0,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.red, size: 20),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
