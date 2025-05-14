import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/auth/forgotPassword/data/model/forget_passowrd_model.dart';
import 'package:foodia_app/features/auth/forgotPassword/data/repo/forgot_passowrd_repo.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/networking/api/end_points.dart';

class ForgotPassowrdRepoImpl implements ForgotPassowrdRepo {
  final ApiService apiService;

  ForgotPassowrdRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ForgetPassowrdModel>> forgetPassword({
    required String phone,
  }) async {
    try {
      final response = await apiService.post(
        EndPoints.forgetPassword,
        data: {'phone': phone},
      );
      final forgetPassowrdModel = ForgetPassowrdModel.fromJson(response);
      return Right(forgetPassowrdModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
