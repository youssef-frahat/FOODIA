part of 'all_followers_cubit.dart';

abstract class AllFollowersState extends Equatable {
  const AllFollowersState();

  @override
  List<Object?> get props => [];
}

class AllFollowersInitial extends AllFollowersState {}

class AllFollowersLoading extends AllFollowersState {}

class AllFollowersFailure extends AllFollowersState {
  final String error;

  const AllFollowersFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class AllFollowersChefe extends AllFollowersState {
  final GetMyFollowrsModel followers;

  const AllFollowersChefe(this.followers);

  @override
  List<Object?> get props => [followers];
}

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
