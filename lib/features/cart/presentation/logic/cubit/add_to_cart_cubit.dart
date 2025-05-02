import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';
import 'package:foodia_app/features/cart/data/repo/add_to_cart_repo_impl.dart';

import '../../../data/model/get_all_cart_re_model/get_all_cart_re_model.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartRepoImpl addToCartRepo;
  AddToCartCubit(this.addToCartRepo) : super(AddToCartInitial());

  Future<void> addToCart({required int foodId, required int quantity}) async {
    emit(AddToCartLoading());

    final result = await addToCartRepo.addToCart(
      foodId: foodId,
      quantity: quantity,
    );

    result.fold((failure) => emit(AddToCartError(failure.message)), (
      addToCartModel,
    ) {
      if (addToCartModel.status == true) {
        emit(AddToCartSuccess(addToCartModel));
      } else {
        emit(AddToCartError(addToCartModel.message ?? "فشل في إضافة المنتج"));
      }
    });
  }


  Future<void> getCart() async {
    emit(GetAllCartLoading());
    final result = await addToCartRepo.getCart();
    result.fold((failure) => emit(GetAllCartError(failure.message)), (
      getAllCartReModel,
    ) {
      log('GetAllCartReModel: ${getAllCartReModel.toString()}');
      emit(GetAllCartSuccess(getAllCartReModel));
    });
  }
}
