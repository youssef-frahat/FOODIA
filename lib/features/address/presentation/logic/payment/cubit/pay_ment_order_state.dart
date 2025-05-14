part of 'pay_ment_order_cubit.dart';

abstract class PayMentOrderState extends Equatable {
  const PayMentOrderState();

  @override
  List<Object?> get props => [];
}

class PayMentOrderInitial extends PayMentOrderState {}

class PayMentOrderLoading extends PayMentOrderState {}

class PayMentOrderSuccess extends PayMentOrderState {
  final PaymentResponseModel response;

  const PayMentOrderSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class PayMentOrderFailure extends PayMentOrderState {
  final String error;

  const PayMentOrderFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class PayMentInsufficientBalance extends PayMentOrderState {
  final String message;
  const PayMentInsufficientBalance(this.message);

  @override
  List<Object> get props => [message];
}
