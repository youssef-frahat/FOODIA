import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/followers/data/model/get_all_followers_chefe_model/get_all_followers_chefe_model.dart';
import 'package:foodia_app/features/followers/data/repo/get_followers/get_followr_repo.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/networking/api/end_points.dart';

class GetFollowerRepoImpl implements GetFollowersRepo{
  final ApiService apiService;
  GetFollowerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetAllFollowersChefeModel>> getFollowers()async {
    try {
      final response = await apiService.get(EndPoints.getFollowers);
      GetAllFollowersChefeModel getAllFollowersChefeModel = GetAllFollowersChefeModel.fromJson(response);
      return Right(getAllFollowersChefeModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
 
}