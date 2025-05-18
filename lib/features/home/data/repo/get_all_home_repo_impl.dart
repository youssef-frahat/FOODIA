import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/followers/data/model/follow_cefe_model.dart';
import 'package:foodia_app/features/home/data/model/review_order_model/review_order_model.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/app_config/prefs_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/connectivity_helper.dart';
import '../../../../core/helpers/secure_local_storage.dart';
import '../../../../core/networking/api/end_points.dart';
import '../model/get_all_category_model/get_all_categorys_model.dart';
import '../model/get_all_details_reposne_model/get_all_details_reposne_model.dart';
import '../model/get_home_foods_model/get_home_foods_model.dart';
import 'get_all_home_repo.dart';

class GetAllHomeRepoImpl implements GetAllHomeRepo {
  final ApiService apiService;

  GetAllHomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetAllCategorysModel>> listAllcategories() async {
    try {
      final response = await apiService.get(EndPoints.getAllCategorys);
      GetAllCategorysModel getAllCategorysModel = GetAllCategorysModel.fromJson(
        response,
      );
      return Right(getAllCategorysModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, GetHomeFoodsModel>> getAllHomeFoods({
    required String foodName,
    int pageNumber = 1,
  }) async {
    try {
      final response = await apiService.get(
       '${EndPoints.getAllfoods}?page=$pageNumber',
       
      );
      GetHomeFoodsModel getHomeFoodsModel = GetHomeFoodsModel.fromJson(
        response,
      );
      return Right(getHomeFoodsModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, GetAllDetailsReposneModel>> getAllDetalisById({
    required num foodId,
  }) async {
    try {
      final response = await apiService.get(
        '${EndPoints.getAllDetails}/$foodId',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${await SecureLocalStorage.read(PrefsKeys.token)}',
        },
      );
      GetAllDetailsReposneModel getAllDetalisResponse =
          GetAllDetailsReposneModel.fromJson(response);
      return Right(getAllDetalisResponse);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, FollowCefeModel>> followCefe({
    required num cefeId,
  }) async {
    try {
      final response = await apiService.post(
        EndPoints.followChef,
        data: {'chef_id': cefeId},
      );
      FollowCefeModel cefeModel = FollowCefeModel.fromJson(response);
      return Right(cefeModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, ReviewOrderModel>> submitReview({
    required int foodId,
    required String star,
    required String comment,
  }) async {
    if (!await ConnectivityHelper.connected) {
      return const Left(NetworkFailure(AppStrings.checkInternetConnection));
    }
    try {
      final response = await apiService.post(
        EndPoints.reviews,
        data: {'food_id': foodId, 'star': star, 'comment': comment},
      );
      final user = ReviewOrderModel.fromJson(response);
      print('Response from submitReview API: $response');
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
