import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/followers/data/model/chefe_profile_model/chefe_profile_model.dart';
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

 @override
Future<Either<Failure, ChefeProfileModel>> getProfileChefe({required int cefeId}) async {
  try {
    // إرسال الطلب
    final response = await apiService.get('${EndPoints.getProfileChefe}/$cefeId');
    
    // تسجيل الـ response
    log("API Response: $response");

    // التأكد من صحة الاستجابة
    if (response == null || response['status'] != true) {
      return Left(ServerFailure('Invalid response or status not true'));
    }

    // تحويل الاستجابة إلى موديل
    ChefeProfileModel chefeProfileModel = ChefeProfileModel.fromJson(response);
    
    return Right(chefeProfileModel);
  } on ServerException catch (e) {
    // استثناءات الخادم
    return Left(ServerFailure(e.message));
  } catch (e) {
    // استثناءات أخرى
    return Left(ServerFailure('Unexpected error occurred: $e'));
  }
}

  }

