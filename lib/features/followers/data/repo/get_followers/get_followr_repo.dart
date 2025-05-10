import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../model/chefe_profile_model/chefe_profile_model.dart';
import '../../model/get_all_follors_chefe_model/get_all_follors_chefe_model.dart';
import '../../model/get_foodes_chefe_model/get_foodes_chefe_model.dart';

abstract class GetFollowersRepo {
  Future<Either<Failure, GetAllFollorsChefeModel>> getChefeFollowers();
  Future<Either<Failure, GetFoodesChefeModel>> getFoodeChefe();
  Future<Either<Failure, ChefeProfileModel>> getProfileChefe({required int cefeId});
}
