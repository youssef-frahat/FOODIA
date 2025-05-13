part of 'cheke_out_cubit.dart';

sealed class ChekeOutState extends Equatable {
  const ChekeOutState();

  @override
  List<Object> get props => [];
}

final class ChekeOutInitial extends ChekeOutState {}

final class ChekeOutLoading extends ChekeOutState {}

final class ChekeOutSuccess extends ChekeOutState {
  final ChekeOutOrderModel chekeOutOrderModel;
  const ChekeOutSuccess(this.chekeOutOrderModel);
}

final class ChekeOutFailure extends ChekeOutState {
  final Failure failure;
  const ChekeOutFailure(this.failure);
}
