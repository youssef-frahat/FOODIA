part of 'all_followers_cubit.dart';

abstract class AllFollowersState extends Equatable {
  const AllFollowersState();
  @override
  List<Object?> get props => [];
}

class AllFollowersInitial extends AllFollowersState {}

class GetAllFollowersChefeLoading extends AllFollowersState {}

class GetAllFollowersChefeSuccess extends AllFollowersState {
  final GetAllFollowersChefeModel getAllFollowersChefeModel;

  const GetAllFollowersChefeSuccess(this.getAllFollowersChefeModel);

  @override
  List<Object?> get props => [getAllFollowersChefeModel];
}

class GetAllFollowersChefeFailure extends AllFollowersState {
  final String error;

  const GetAllFollowersChefeFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class SelectedChefChanged extends AllFollowersState {
  final List<FoodModel> selectedFoods;

  const SelectedChefChanged(this.selectedFoods);

  @override
  List<Object?> get props => [selectedFoods];
}
