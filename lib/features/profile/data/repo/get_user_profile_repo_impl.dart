import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:foodia_app/core/errors/failures.dart';

import 'package:foodia_app/features/profile/data/model/get_user_profile_model/get_user_profile_model.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/connectivity_helper.dart';
import '../../../../core/networking/api/api_services.dart';
import '../../../../core/networking/api/end_points.dart';
import 'get_user_profile_repo.dart';

class GetUserProfileRepoImpl implements GetUserProfileRepo {
  final ApiService apiService;

  GetUserProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetUserProfileModel>> getUserProfile() async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }

      final response = await apiService.get(EndPoints.profile);
      log('Get user Profile response: $response');

      if (response == null || response['data'] == null) {
        return Left(ServerFailure("No data found"));
      }

    final GetUserProfileModel user = GetUserProfileModel.fromJson(response);

      log('Get user Profile model: ${user.toJson()}');
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Unexpected error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
