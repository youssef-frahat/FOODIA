part of 'order_item_cubit.dart';

sealed class OrderItemState extends Equatable {
  const OrderItemState();

  @override
  List<Object> get props => [];
}

final class OrderItemInitial extends OrderItemState {}

final class OrderItemLoading extends OrderItemState {}

final class OrderItemLoaded extends OrderItemState {
  final GetAllOrderItemModel getAllOrderItemModel;
  const OrderItemLoaded(this.getAllOrderItemModel);

  @override
  List<Object> get props => [getAllOrderItemModel];
}

final class OrderItemError extends OrderItemState {
  final String message;
  const OrderItemError(this.message);
}

//! cancel order

final class OrderItemCancelSuccess extends OrderItemState {
  final CanseleOrderModel canseleOrderModel;
  const OrderItemCancelSuccess(this.canseleOrderModel);
}

final class OrderItemCancelError extends OrderItemState {
  final String message;
  const OrderItemCancelError(this.message);
}

final class OrderItemCancelLoading extends OrderItemState {}
