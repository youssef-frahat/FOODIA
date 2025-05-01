import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/get_all_category_model/get_all_categorys_model.dart';
import '../model/get_home_foods_model/get_home_foods_model.dart';

abstract class GetAllHomeRepo {
  Future<Either<Failure, GetAllCategorysModel>> listAllcategories();
  Future<Either<Failure, GetHomeFoodsModel>> getAllHomeFoods({
    required String foodName,
  });
}
