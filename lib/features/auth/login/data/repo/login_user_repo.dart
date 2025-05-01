import 'package:dartz/dartz.dart';
import 'package:foodia_app/features/auth/login/data/model/login_succ_model/login_succ_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class LoginUserRepo {
  Future<Either<Failure, LoginSuccModel>> login({
    required String phone,
    required String password,
  });
}
