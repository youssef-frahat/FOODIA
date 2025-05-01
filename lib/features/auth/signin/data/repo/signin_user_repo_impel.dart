import 'package:dartz/dartz.dart';

import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/end_points.dart';

import 'package:foodia_app/features/auth/signin/data/model/signin_response_model/signin_response_model.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/helpers/connectivity_helper.dart';
import '../../../../../core/networking/api/api_services.dart';
import 'signin_repo.dart';

class SigninUserRepoImpel implements SigninRepo {
  final ApiService apiService;

  SigninUserRepoImpel(this.apiService);

  @override
  Future<Either<Failure, SigninResponseModel>> signinUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.post(
        EndPoints.register,
        data: {
          'name': name,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'email': email,
        },
      );
      final user = SigninResponseModel.fromJson(response);
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
