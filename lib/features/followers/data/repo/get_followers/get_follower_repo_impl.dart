import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/followers/data/model/chefe_profile_model/chefe_profile_model.dart';
import 'package:foodia_app/features/followers/data/model/delete_follow_chefe_model.dart';
import 'package:foodia_app/features/followers/data/repo/get_followers/get_followr_repo.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/networking/api/end_points.dart';
import '../../model/get_my_followrs_model/get_my_followrs_model.dart';

class GetFollowerRepoImpl implements GetFollowersRepo {
  final ApiService apiService;
  GetFollowerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetMyFollowrsModel>> getChefeFollowers() async {
    try {
      final response = await apiService.get(EndPoints.getFollowers);
      GetMyFollowrsModel getAllFollowersChefeModel =
          GetMyFollowrsModel.fromJson(response);
      return Right(getAllFollowersChefeModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  // @override
  // Future<Either<Failure, GetFoodesChefeModel>> getFoodeChefe() async {
  //   try {
  //     final response = await apiService.get(EndPoints.getFoodsChefe);
  //    GetFoodesChefeModel getFoodesChefeModel = GetFoodesChefeModel.fromJson(response['data']);

  //     return Right(getFoodesChefeModel);
  //   } on NetworkException catch (e) {
  //     return Left(NetworkFailure(e.message));
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message));
  //   } catch (e) {
  //     return Left(ServerFailure(AppStrings.unexpectedError));
  //   }
  // }

  @override
  Future<Either<Failure, ChefeProfileModel>> getProfileChefe({
    required int cefeId,
  }) async {
    try {
      final response = await apiService.get(
        '${EndPoints.getProfileChefe}/$cefeId',
      );

      log("API Response: $response");

      if (response == null || response['status'] != true) {
        return Left(ServerFailure('Invalid response or status not true'));
      }

      ChefeProfileModel chefeProfileModel = ChefeProfileModel.fromMap(response);

      return Right(chefeProfileModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, DeleteFollowChefeModel>> deleteFollowChefe({
    required int chefeId,
  }) async {
    try {
      final response = await apiService.delete(
        '${EndPoints.unfollowChef}/$chefeId',
      );

      log("Unfollow API Response: $response");

      if (response == null || response['status'] != true) {
        return Left(ServerFailure(response['message'] ?? 'Unfollow failed'));
      }

      final result = DeleteFollowChefeModel.fromJson(response);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
