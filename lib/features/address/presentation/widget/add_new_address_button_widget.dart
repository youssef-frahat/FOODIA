import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_config/app_colors.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/custom_text_field.dart';
import '../../../../core/witgets/primary_button.dart';
import 'next_button_widget.dart';

class AddNewAddressButtonWidget extends StatelessWidget {
  const AddNewAddressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            _showAddNewAddressDialog(context);
          },
          icon: const Icon(Icons.add_circle_outline, color: Colors.orange),
          label: const Text(
            "اضافة عنوان جديد",
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        verticalSpace(16),
        NextButtonWidget(onPressed: () {}),
      ],
    );
  }

  void _showAddNewAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white, // Custom background color for the dialog
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button (×) at the top-left corner
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const Text(
                  "اضافة عنوان جديد",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(16),
                // Using MyTextFormField directly
                MyTextFormField(
                  hintText: 'المدينة',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى ادخال المدينة';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                MyTextFormField(
                  hintText: 'المركز',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى ادخال المركز';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                MyTextFormField(
                  hintText: 'الحي',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى ادخال الحي';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                MyTextFormField(
                  hintText: 'الشارع',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى ادخال الشارع';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                MyTextFormField(
                  hintText: 'المبني',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى ادخال رقم المبني او اسم العمارة';
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                Primarybutton(
                  buttontext: 'اضافة',
                  buttoncolor: AppColors.primarycolor,
                  hight: 48.h,
                  borderrediuse: 50.r,
                  textcolor: Colors.white,
                  onpress: () {
                    // Handle the add address logic here
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
