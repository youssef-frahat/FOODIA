part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPassowrdModel forgetPassowrdModel;
  const ForgetPasswordSuccess(this.forgetPassowrdModel);
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  const ForgetPasswordError(this.message);
}
