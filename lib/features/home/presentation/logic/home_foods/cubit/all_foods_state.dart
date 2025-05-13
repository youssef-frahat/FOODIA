part of 'all_foods_cubit.dart';

abstract class AllFoodsState extends Equatable {
  const AllFoodsState();

  @override
  List<Object?> get props => [];
}

class AllFoodsInitial extends AllFoodsState {}

class AllFoodsLoading extends AllFoodsState {}

class AllFoodsLoaded extends AllFoodsState {
  final List<FoodsModel> foods;

  const AllFoodsLoaded(this.foods);

  @override
  List<Object?> get props => [foods];
}

class AllFoodsError extends AllFoodsState {
  final String error;

  const AllFoodsError(this.error);

  @override
  List<Object?> get props => [error];
}

class AllDetailsLoading extends AllFoodsState {}

class AllDetailsSucss extends AllFoodsState {
  final GetAllDetailsReposneModel getAllDetalisResponseModel;

  const AllDetailsSucss(this.getAllDetalisResponseModel);

  @override
  List<Object?> get props => [getAllDetalisResponseModel];
}

class AllDetailsError extends AllFoodsState {
  final String error;

  const AllDetailsError(this.error);

  @override
  List<Object?> get props => [error];
}


class FollowChef extends AllFoodsState {
  final FollowCefeModel followCefe;

  const FollowChef(this.followCefe);

  @override
  List<Object?> get props => [followCefe];
}

class FollowChefError extends AllFoodsState {
  final String error;

  const FollowChefError(this.error);

  @override
  List<Object?> get props => [error];
}
