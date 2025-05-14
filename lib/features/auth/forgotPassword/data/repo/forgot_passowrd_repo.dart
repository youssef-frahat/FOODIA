import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../model/forget_passowrd_model.dart';

abstract class ForgotPassowrdRepo {
  Future<Either<Failure, ForgetPassowrdModel>> forgetPassword({
    required String phone,
  });
}
