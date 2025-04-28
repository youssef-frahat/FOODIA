import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/get_user_profile_model/get_user_profile_model.dart';

abstract class GetUserProfileRepo {
  Future<Either<Failure, GetUserProfileModel>> getUserProfile();
  // Future<void> updateUserProfile();

}