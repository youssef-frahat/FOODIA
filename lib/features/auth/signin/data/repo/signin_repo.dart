import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../model/signin_response_model/signin_response_model.dart';

abstract class SigninRepo {
  Future<Either<Failure, SigninResponseModel>> signinUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}
