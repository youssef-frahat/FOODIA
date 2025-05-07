import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../model/get_all_followers_chefe_model/get_all_followers_chefe_model.dart';

abstract class GetFollowersRepo {
  Future<Either<Failure, GetAllFollowersChefeModel>> getFollowers();
}
