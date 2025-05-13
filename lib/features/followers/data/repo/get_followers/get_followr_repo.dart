import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../model/chefe_profile_model/chefe_profile_model.dart';
import '../../model/get_my_followrs_model/get_my_followrs_model.dart';

abstract class GetFollowersRepo {
  Future<Either<Failure, GetMyFollowrsModel>> getChefeFollowers();
  // Future<Either<Failure, GetFoodesChefeModel>> getFoodeChefe();
  Future<Either<Failure, ChefeProfileModel>> getProfileChefe({
    required int cefeId,
  });
}
