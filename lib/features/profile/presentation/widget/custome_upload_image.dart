import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUploadImage extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;
final String? networkImage;
  const CustomUploadImage({
    super.key,
    required this.selectedImage,
    required this.onTap, this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.orange,
            width: 4,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
           if (selectedImage != null)
  ClipOval(
    child: Image.file(
      selectedImage!,
      width: 120.w,
      height: 120.h,
      fit: BoxFit.cover,
    ),
  )
else if (networkImage != null && networkImage!.isNotEmpty)
  ClipOval(
    child: Image.network(
      networkImage!,
      width: 120.w,
      height: 120.h,
      fit: BoxFit.cover,
    ),
  )
else
  Text(
    "AR",
    style: TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
  ),

            Positioned(
              right: 140.w,
              bottom: 0,
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.camera_alt, size: 20, color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
