part of 'all_followers_cubit.dart';

abstract class AllFollowersState extends Equatable {
  const AllFollowersState();
  @override
  List<Object?> get props => [];
}

class AllFollowersInitial extends AllFollowersState {}

class GetAllFollowersChefeLoading extends AllFollowersState {}

class GetAllFollowersChefeSuccess extends AllFollowersState {
  final GetAllFollorsChefeModel getAllFollowersChefeModel;

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

// get foodes

class GetFoodesChefeLoading extends AllFollowersState {}

class GetFoodesChefeSuccess extends AllFollowersState {
  final GetFoodesChefeModel getFoodesChefeModel;

  const GetFoodesChefeSuccess(this.getFoodesChefeModel);

  @override
  List<Object?> get props => [getFoodesChefeModel];
}

class GetFoodesChefeFailure extends AllFollowersState {
  final String error;

  const GetFoodesChefeFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// !

class GetProfileChefeLoading extends AllFollowersState {}

class GetProfileChefeSuccess extends AllFollowersState {
  final ChefeProfileModel chefeProfileModel;

  const GetProfileChefeSuccess(this.chefeProfileModel);

  @override
  List<Object?> get props => [chefeProfileModel];
}

class GetProfileChefeFailure extends AllFollowersState {
  final String error;

  const GetProfileChefeFailure(this.error);

  @override
  List<Object?> get props => [error];
}
