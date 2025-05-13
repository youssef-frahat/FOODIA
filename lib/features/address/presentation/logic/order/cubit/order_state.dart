part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class GetOrderScuccess extends OrderState {
  final GetOrderDetilasModel order;
  const GetOrderScuccess(this.order);
  @override
  List<Object> get props => [order];
}

final class GetOrderFailure extends OrderState {
  final Failure failure;
  const GetOrderFailure(this.failure);
  @override
  List<Object> get props => [failure];
}


final class  GetOrderLoading extends OrderState {}