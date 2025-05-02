part of 'all_foods_cubit.dart';

sealed class AllFoodsState extends Equatable {
  const AllFoodsState();

  @override
  List<Object> get props => [];
}

final class AllFoodsInitial extends AllFoodsState {}

final class AllFoodsLoading extends AllFoodsState {}

final class AllFoodsLoaded extends AllFoodsState {
  final GetHomeFoodsModel getHomeFoodsModel;

  const AllFoodsLoaded(this.getHomeFoodsModel);

  @override
  List<Object> get props => [getHomeFoodsModel];
}

final class AllFoodsError extends AllFoodsState {
  final String error;

  const AllFoodsError(this.error);

  @override
  List<Object> get props => [error];
}

//! Get All Details By Id
final class AllDetailsLoading extends AllFoodsState {}

final class AllDetailsSucss extends AllFoodsState {
  final GetAllDetailsReposneModel getAllDetalisResponseModel;

  const AllDetailsSucss(this.getAllDetalisResponseModel);

  @override
  List<Object> get props => [getAllDetalisResponseModel];
}

final class AllDetailsError extends AllFoodsState {
  final String error;

  const AllDetailsError(this.error);

  @override
  List<Object> get props => [error];
}
