part of 'order_item_cubit.dart';

sealed class OrderItemState extends Equatable {
  const OrderItemState();

  @override
  List<Object?> get props => [];
}

final class OrderItemInitial extends OrderItemState {}

final class OrderItemLoading extends OrderItemState {}

final class OrderItemLoaded extends OrderItemState {
  final GetAllOrderResponseModel order;
  const OrderItemLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

final class OrderItemError extends OrderItemState {
  final String message;
  const OrderItemError(this.message);

  @override
  List<Object?> get props => [message];
}

//! cancel order

final class OrderItemCancelSuccess extends OrderItemState {
  final CanseleOrderModel canseleOrderModel;
  const OrderItemCancelSuccess(this.canseleOrderModel);

  @override
  List<Object?> get props => [canseleOrderModel];
}

final class OrderItemCancelError extends OrderItemState {
  final String message;
  const OrderItemCancelError(this.message);

  @override
  List<Object?> get props => [message];
}

final class OrderItemCancelLoading extends OrderItemState {}
