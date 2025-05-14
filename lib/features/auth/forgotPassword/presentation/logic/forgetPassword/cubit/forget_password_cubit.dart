import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/forget_passowrd_model.dart';
import '../../../../data/repo/forgot_passowrd_repo_impl.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgotPassowrdRepoImpl forgotPassowrdRepoImpl;
  ForgetPasswordCubit(this.forgotPassowrdRepoImpl)
    : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String phone}) async {
    emit(ForgetPasswordLoading());
    final result = await forgotPassowrdRepoImpl.forgetPassword(phone: phone);
    result.fold(
      (l) => emit(ForgetPasswordError(l.message)),
      (r) => emit(ForgetPasswordSuccess(r)),
    );
  }
}
