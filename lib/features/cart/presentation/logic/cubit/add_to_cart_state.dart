part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final AddToCartModel addToCartModel;
  const AddToCartSuccess(this.addToCartModel);

  @override
  List<Object> get props => [addToCartModel];
}

final class AddToCartError extends AddToCartState {
  final String error;

  const AddToCartError(this.error);

  @override
  List<Object> get props => [error];
}

//! GET CART

final class GetAllCartLoading extends AddToCartState {}

final class GetAllCartSuccess extends AddToCartState {
  final GetAllCartReModel getAllCartReModel;
  const GetAllCartSuccess(this.getAllCartReModel);

  @override
  List<Object> get props => [getAllCartReModel];
}

final class GetAllCartError extends AddToCartState {
  final String error;

  const GetAllCartError(this.error);

  @override
  List<Object> get props => [error];
}

//! DELETE FROM CART

final class DeleteItemFromCartLoading extends AddToCartState {}

final class DeleteItemFromCartSuccess extends AddToCartState {
  final DeletItemCartModel deletItemCartModel;
  const DeleteItemFromCartSuccess(this.deletItemCartModel);

  @override
  List<Object> get props => [deletItemCartModel];
}

final class DeleteItemFromCartError extends AddToCartState {
  final String error;

  const DeleteItemFromCartError(this.error);

  @override
  List<Object> get props => [error];
}
