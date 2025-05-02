import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/home/data/model/get_all_detalis_response_model/get_all_detalis_response_model.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/app_config/prefs_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/secure_local_storage.dart';
import '../../../../core/networking/api/end_points.dart';
import '../model/get_all_category_model/get_all_categorys_model.dart';
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
  }) async {
    try {
      final response = await apiService.get(
        EndPoints.getAllfoods,
        queryParameters: {'food_name': foodName},
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
  Future<Either<Failure, GetAllDetalisResponseModel>> getAllDetalisById({required num foodId}) async {
   try {
     final response = await apiService.get('${EndPoints.getAllDetails}/$foodId',
     headers: {
       'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await SecureLocalStorage.read(PrefsKeys.token)}',
     }
     );
      GetAllDetalisResponseModel getAllDetalisResponse = GetAllDetalisResponseModel.fromJson(
        response,
      );
      return Right(getAllDetalisResponse);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
