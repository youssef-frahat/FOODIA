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
