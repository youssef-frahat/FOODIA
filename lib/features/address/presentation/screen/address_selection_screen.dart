import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';

import '../../../../core/app_config/app_colors.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/primary_button.dart';
import '../logic/cubit/all_adress_user_cubit.dart';
import '../widget/add_new_address_button_widget.dart';
import '../widget/address_card_widget.dart';
import '../widget/stepprogress_bar_widget.dart';

class AddressSelectionScreen extends StatefulWidget {
  const AddressSelectionScreen({super.key});

  @override
  State<AddressSelectionScreen> createState() => _AddressSelectionScreenState();
}

class _AddressSelectionScreenState extends State<AddressSelectionScreen> {
  int currentStep = 0;
  int? selectedAddressId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AllAdressUserCubit>()..getAllAdressUser(),
        child: BlocBuilder<AllAdressUserCubit, AllAdressUserState>(
          builder: (context, state) {
            if (state is AllAdressUserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AllAdressUserFailure) {
              return Center(child: Text(state.failure.message));
            } else if (state is AllAdressUserSuccess) {
              final allAdressUser = state.getAllAdressUserModel.data;
              return SafeArea(
                child: Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    children: [
                      ExactStepperWidget(currentStep: currentStep),
                      verticalSpace(16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: allAdressUser!.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AddressCardWidget(
                              city: allAdressUser[index].city!,
                              address:
                                  '${allAdressUser[index].street}, ${allAdressUser[index].neighborhood}, ${allAdressUser[index].buildingNumber}',
                              id: allAdressUser[index].id!,
                              selected:
                                  selectedAddressId == allAdressUser[index].id,
                              onTap: () {
                                setState(() {
                                  selectedAddressId = allAdressUser[index].id;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      AddNewAddressButtonWidget(),
                      verticalSpace(10),
                      Primarybutton(
                        buttontext: 'التالي',
                        borderrediuse: 50,
                        buttoncolor: AppColors.primarycolor,
                        fontsize: 16,
                        hight: 50,
                        width: 300,
                        onpress: () {
                          if (selectedAddressId == null) {
                            AppMessages.showError(
                              context,
                              'يرجى اختيار عنوانك',
                            );
                          } else {
                            setState(() {
                              currentStep++;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
