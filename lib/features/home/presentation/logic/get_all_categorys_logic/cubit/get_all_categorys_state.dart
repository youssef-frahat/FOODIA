part of 'get_all_categorys_cubit.dart';

sealed class GetAllCategorysState extends Equatable {
  const GetAllCategorysState();

  @override
  List<Object> get props => [];
}

final class GetAllCategorysInitial extends GetAllCategorysState {}

final class GetAllCategorysLoading extends GetAllCategorysState {}

final class GetAllCategorysLoaded extends GetAllCategorysState {
  final GetAllCategorysModel categories;

  const GetAllCategorysLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class GetAllCategorysError extends GetAllCategorysState {
  final String message;

  const GetAllCategorysError(this.message);

  @override
  List<Object> get props => [message];
}
