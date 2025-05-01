import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/signin_response_model/signin_response_model.dart';
import '../../../data/repo/signin_user_repo_impel.dart';

part 'signin_user_state.dart';

class SigninUserCubit extends Cubit<SigninUserState> {
  final SigninUserRepoImpel signinUserRepoImpel;
  SigninUserCubit(this.signinUserRepoImpel) : super(SigninUserInitial());

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(SigninUserLoading());

    final result = await signinUserRepoImpel.signinUser(
      name: name,
      phone: phone,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    result.fold(
      (failure) => emit(SigninUserError(failure.message)),
      (user) => emit(SigninUserSuccess(signinResponseModel: user)),
    );
  }
}
