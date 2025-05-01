import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/auth/login/data/model/login_succ_model/login_succ_model.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../data/repo/login_user_repo_impl.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  final LoginUserRepoImpl loginUserRepo;
  LoginUserCubit(this.loginUserRepo) : super(LoginUserInitial());

  Future<void> login({required String phone, required String password}) async {
    emit(LoginUserLoading());
    final result = await loginUserRepo.login(phone: phone, password: password);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(LoginUserError(error: failure.message));
      }
      if (failure is NetworkFailure) {
        emit(LoginUserError(error: failure.message));
      }
      if (failure is AuthFailure) {
        emit(LoginUserError(error: failure.message));
      }
      if (failure is VerificationFailure) {
        emit(LoginUserError(error: failure.message));
      }
    }, (user) => emit(LoginUserSuccess(loginSuccModel: user)));
  }
}
