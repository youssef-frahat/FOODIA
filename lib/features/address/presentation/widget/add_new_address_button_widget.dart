import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/app_colors.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import 'package:foodia_app/core/witgets/custom_text_field.dart';
import 'package:foodia_app/core/witgets/primary_button.dart';
import '../logic/cubit/all_adress_user_cubit.dart';

class AddNewAddressButtonWidget extends StatelessWidget {
  final int? addressId;
  final String? city;
  final String? center;
  final String? neighborhood;
  final String? street;
  final String? building;
  final bool triggerDialog; // ✅ جديد

  const AddNewAddressButtonWidget({
    super.key,
    this.addressId,
    this.city,
    this.center,
    this.neighborhood,
    this.street,
    this.building,
    this.triggerDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    if (triggerDialog) {
      Future.delayed(Duration.zero, () {
        _showAddNewAddressDialog(context);
      });
    }

    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            _showAddNewAddressDialog(context);
          },
          icon: Icon(
            addressId == null ? Icons.add_circle_outline : Icons.edit,
            color: Colors.orange,
          ),
          label: Text(
            addressId == null ? "اضافة عنوان جديد" : "تعديل العنوان",
            style: const TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  void _showAddNewAddressDialog(BuildContext context) {
    final cityController = TextEditingController(text: city ?? '');
    final centerController = TextEditingController(text: center ?? '');
    final neighborhoodController = TextEditingController(
      text: neighborhood ?? '',
    );
    final streetController = TextEditingController(text: street ?? '');
    final buildingController = TextEditingController(text: building ?? '');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: context.read<AllAdressUserCubit>(),
          child: BlocConsumer<AllAdressUserCubit, AllAdressUserState>(
            listener: (context, state) {
              if (state is AddAdressUserSuccess ||
                  state is UpdateAdressUserSuccess) {
                Navigator.of(dialogContext).pop();
                AppMessages.showSuccess(context, 'تم الحفظ بنجاح');
                context.read<AllAdressUserCubit>().getAllAdressUser();
              } else if (state is AllAdressUserFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.failure.message)));
              }
            },
            builder: (context, state) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed:
                                  () => Navigator.of(dialogContext).pop(),
                            ),
                          ),
                          Text(
                            addressId == null
                                ? "اضافة عنوان جديد"
                                : "تعديل العنوان",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          verticalSpace(16),
                          MyTextFormField(
                            controller: cityController,
                            hintText: 'المدينة',
                            validator:
                                (v) => v!.isEmpty ? 'يرجى ادخال المدينة' : null,
                          ),
                          verticalSpace(16),
                          MyTextFormField(
                            controller: centerController,
                            hintText: 'المركز',
                            validator:
                                (v) => v!.isEmpty ? 'يرجى ادخال المركز' : null,
                          ),
                          verticalSpace(16),
                          MyTextFormField(
                            controller: neighborhoodController,
                            hintText: 'الحي',
                            validator:
                                (v) => v!.isEmpty ? 'يرجى ادخال الحي' : null,
                          ),
                          verticalSpace(16),
                          MyTextFormField(
                            controller: streetController,
                            hintText: 'الشارع',
                            validator:
                                (v) => v!.isEmpty ? 'يرجى ادخال الشارع' : null,
                          ),
                          verticalSpace(16),
                          MyTextFormField(
                            controller: buildingController,
                            hintText: 'المبني',
                            keyboardType: TextInputType.number,
                            validator:
                                (v) => v!.isEmpty ? 'يرجى ادخال المبني' : null,
                          ),
                          verticalSpace(16),
                          state is AllAdressUserLoading
                              ? const CircularProgressIndicator()
                              : Primarybutton(
                                buttontext:
                                    addressId == null ? 'اضافة' : 'تحديث',
                                buttoncolor: AppColors.primarycolor,
                                hight: 48.h,
                                borderrediuse: 50.r,
                                textcolor: Colors.white,
                                onpress: () {
                                  if (formKey.currentState!.validate()) {
                                    if (addressId == null) {
                                      context
                                          .read<AllAdressUserCubit>()
                                          .addToAdress(
                                            city: cityController.text,
                                            center: centerController.text,
                                            neighborhood:
                                                neighborhoodController.text,
                                            street: streetController.text,
                                            buildingNumber:
                                                buildingController.text,
                                          );
                                    } else {
                                      context
                                          .read<AllAdressUserCubit>()
                                          .updateAdress(
                                            id: addressId!,
                                            city: cityController.text,
                                            center: centerController.text,
                                            neighborhood:
                                                neighborhoodController.text,
                                            street: streetController.text,
                                            buildingNumber:
                                                buildingController.text,
                                          );
                                    }
                                  }
                                },
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
