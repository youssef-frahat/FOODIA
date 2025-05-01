part of 'login_user_cubit.dart';

sealed class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

final class LoginUserInitial extends LoginUserState {}

final class LoginUserLoading extends LoginUserState {}

final class LoginUserSuccess extends LoginUserState {
  final LoginSuccModel loginSuccModel;

  const LoginUserSuccess({required this.loginSuccModel});

  @override
  List<Object> get props => [loginSuccModel];
}

final class LoginUserError extends LoginUserState {
  final String error;

  const LoginUserError({required this.error});

  @override
  List<Object> get props => [error];
}
