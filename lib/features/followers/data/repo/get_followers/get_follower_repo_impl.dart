import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/followers/data/model/get_foodes_chefe_model/get_foodes_chefe_model.dart';
import 'package:foodia_app/features/followers/data/repo/get_followers/get_followr_repo.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/networking/api/end_points.dart';
import '../../model/get_all_follors_chefe_model/get_all_follors_chefe_model.dart';

class GetFollowerRepoImpl implements GetFollowersRepo {
  final ApiService apiService;
  GetFollowerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetAllFollorsChefeModel>> getChefeFollowers() async {
    try {
      final response = await apiService.get(EndPoints.getFollowers);
      GetAllFollorsChefeModel getAllFollowersChefeModel =
          GetAllFollorsChefeModel.fromJson(response);
      return Right(getAllFollowersChefeModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, GetFoodesChefeModel>> getFoodeChefe() async {
    try {
      final response = await apiService.get(EndPoints.getFoodsChefe);
      GetFoodesChefeModel getFoodesChefeModel = GetFoodesChefeModel.fromJson(
        response,
      );
      return Right(getFoodesChefeModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
