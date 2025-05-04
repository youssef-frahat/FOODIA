import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/di/dependency_injection.dart';
import '../logic/cubit/add_to_cart_cubit.dart';
import '../widgets/cart_item_care_widget.dart';
import '../widgets/custom_button_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AddToCartCubit>()..getCart(),
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {
            final cartItems = (state is GetAllCartSuccess) ? state.getAllCartReModel.data : [];

            final totalPrice = cartItems?.fold<num>(0, (sum, item) {
              final price = num.tryParse(item.food?.price.toString() ?? '0') ?? 0;
              final qty = item.qty ?? 1;
              return sum + (price * qty);
            }) ?? 0;

            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 130.h),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      verticalSpace(30),
                      Center(
                        child: Text(
                          'السلة',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Changa',
                          ),
                        ),
                      ),
                      if (state is GetAllCartLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (state is GetAllCartError)
                        Center(child: Text(state.error))
                      else if (state is GetAllCartSuccess)
                        ListView.builder(
                          itemCount: cartItems?.length ?? 0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = cartItems![index];
                            return Dismissible(
                              key: ValueKey(index),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerLeft,
                                padding: REdgeInsets.symmetric(horizontal: 16.w),
                                color: Colors.orange,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Icon(Icons.delete, color: Colors.white, size: 30),
                                ),
                              ),
                              onDismissed: (_) {},
                              child: CartItemCard(
                                title: item.food?.name ?? '',
                                description: item.food?.description ?? '',
                                price: item.food?.price.toString() ?? '0',
                                imageUrl: "$imageUrl${item.food?.image ?? ''}",
                                quantity: item.qty!,
                                onAdd: () {},
                                onRemove: () {},
                              ),
                            );
                          },
                        )
                      else
                        Container(),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CartBottomBar(
                    totalPrice: totalPrice.toInt(),
                    onOrderPressed: () {
                      // تنفيذ الطلب
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
