part of 'un_follow_chef_cubit.dart';

sealed class UnFollowChefState extends Equatable {
  const UnFollowChefState();

  @override
  List<Object?> get props => [];
}

final class UnFollowChefInitial extends UnFollowChefState {}

final class UnFollowChefLoading extends UnFollowChefState {}

final class UnFollowChefSuccess extends UnFollowChefState {
  final DeleteFollowChefeModel model;

  const UnFollowChefSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

final class UnFollowChefError extends UnFollowChefState {
  final String message;

  const UnFollowChefError(this.message);

  @override
  List<Object?> get props => [message];
}
