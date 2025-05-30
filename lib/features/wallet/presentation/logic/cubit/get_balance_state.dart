part of 'get_balance_cubit.dart';

sealed class GetBalanceState extends Equatable {
  const GetBalanceState();

  @override
  List<Object> get props => [];
}

final class GetBalanceInitial extends GetBalanceState {}

final class GetBalanceLoading extends GetBalanceState {}

final class GetBalanceSuccess extends GetBalanceState {
  final GetWalletModel getWalletModel;
  const GetBalanceSuccess(this.getWalletModel);

  @override
  List<Object> get props => [getWalletModel];
}

final class GetBalanceFailure extends GetBalanceState {
  final Failure failure;
  const GetBalanceFailure(this.failure);
}

//!!!! add balance

final class AddBalanceSuccess extends GetBalanceState {
  final AddToBalanceModel addToBalanceModel;
  const AddBalanceSuccess(this.addToBalanceModel);

  @override
  List<Object> get props => [addToBalanceModel];
}

final class AddBalanceFailure extends GetBalanceState {
  final Failure failure;
  const AddBalanceFailure(this.failure);
}

final class AddingBalanceLoading extends GetBalanceState {}
