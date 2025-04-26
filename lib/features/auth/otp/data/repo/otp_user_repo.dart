import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';

abstract class OtpUserRepo {
  Future<Either<Failure, Unit>> verifyOtp({
    required String phoneNumber,
    required String otpCode,
  });
}