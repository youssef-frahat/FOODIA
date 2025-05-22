import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../address/presentation/screen/address_selection_screen.dart';
import '../logic/cubit/add_to_cart_cubit.dart';
import '../widgets/cart_item_care_widget.dart';
import '../widgets/custom_button_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> quantities = [];
  double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'السلة',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Changa',
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<AddToCartCubit>()..getCart(),
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {
            final cartItems =
                (state is GetAllCartSuccess)
                    ? state.getAllCartReModel.data
                    : [];

            totalPrice =
                cartItems?.fold<double>(0.0, (sum, item) {
                  final price =
                      num.tryParse(item.food?.price.toString() ?? '0') ?? 0.0;
                  final qty =
                      quantities.isNotEmpty
                          ? quantities[cartItems.indexOf(item)]
                          : (item.qty ?? 1);
                  return sum + (price * qty);
                }) ??
                0.0;

            return Stack(
              children: [
                if (cartItems?.isEmpty ?? true)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 100,
                          color: Colors.orange,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'سلتك فارغة',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        verticalSpace(30),
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
                              if (quantities.length <= index) {
                                quantities.add(item.qty ?? 1);
                              }
                              return Dismissible(
                                key: ValueKey(index),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  color: Colors.orange,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                onDismissed: (_) async {
                                  final cubit = BlocProvider.of<AddToCartCubit>(
                                    context,
                                  );
                                  await cubit.deleteItemFromCart(
                                    foodId: item.food?.id ?? 0,
                                  );
                                  cubit.getCart();
                                },
                                child: CartItemCard(
                                  title: item.food?.name ?? '',
                                  description: item.food?.description ?? '',
                                  price: item.food?.price.toString() ?? '0',
                                  imageUrl:
                                      "$imageUrl${item.food?.image ?? ''}",
                                  initialQuantity: quantities[index],
                                  onAdd: () {
                                    setState(() {
                                      quantities[index]++;
                                    });
                                  },
                                  onRemove: () {
                                    setState(() {
                                      if (quantities[index] > 1)
                                        quantities[index]--;
                                    });
                                  },
                                ),
                              );
                            },
                          )
                        else
                          Container(),
                      ],
                    ),
                  ),
                if (cartItems?.isNotEmpty ?? false)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CartBottomBar(
                      totalPrice: totalPrice.toInt(),
                      onOrderPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressSelectionScreen(),
                          ),
                        );
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
