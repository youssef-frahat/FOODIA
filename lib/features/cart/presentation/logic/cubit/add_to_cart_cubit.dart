import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';
import 'package:foodia_app/features/cart/data/repo/add_to_cart_repo_impl.dart';

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
    result.fold(
      (failure) => emit(AddToCartError(failure.message)),
      (addToCartModel) => emit(AddToCartSuccess(addToCartModel)),
    );
  }
}
