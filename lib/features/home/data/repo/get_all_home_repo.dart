import 'package:dartz/dartz.dart';
import 'package:foodia_app/features/followers/data/model/follow_cefe_model.dart';

import '../../../../core/errors/failures.dart';
import '../model/get_all_category_model/get_all_categorys_model.dart';
import '../model/get_all_details_reposne_model/get_all_details_reposne_model.dart';
import '../model/get_home_foods_model/get_home_foods_model.dart';
import '../model/review_order_model/review_order_model.dart';

abstract class GetAllHomeRepo {
  Future<Either<Failure, GetAllCategorysModel>> listAllcategories();
  Future<Either<Failure, GetHomeFoodsModel>> getAllHomeFoods({
    required String foodName,
    int pageNumber = 1,
  });
  Future<Either<Failure, GetAllDetailsReposneModel>> getAllDetalisById({
    required num foodId,
  });

  Future<Either<Failure, FollowCefeModel>> followCefe({required num cefeId});

  Future<Either<Failure, ReviewOrderModel>> submitReview({
    required int foodId,
    required String star,
    required String comment,
  });
}
