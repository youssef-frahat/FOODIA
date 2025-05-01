part of 'signin_user_cubit.dart';

sealed class SigninUserState extends Equatable {
  const SigninUserState();

  @override
  List<Object> get props => [];
}

final class SigninUserInitial extends SigninUserState {}

final class SigninUserLoading extends SigninUserState {}

final class SigninUserSuccess extends SigninUserState {
  final SigninResponseModel signinResponseModel;
  const SigninUserSuccess({required this.signinResponseModel});
  @override
  List<Object> get props => [signinResponseModel];
}

final class SigninUserError extends SigninUserState {
  final String error;
  const SigninUserError(this.error);
  @override
  List<Object> get props => [error];
}
