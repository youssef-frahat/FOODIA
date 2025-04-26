import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/auth/login/data/model/login_succ_model/login_succ_model.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/app_config/prefs_keys.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/helpers/connectivity_helper.dart';
import '../../../../../core/helpers/secure_local_storage.dart';
import '../../../../../core/networking/api/end_points.dart';
import 'login_user_repo.dart';

class LoginUserRepoImpl implements LoginUserRepo {
  ApiService apiConsumer;

  LoginUserRepoImpl(this.apiConsumer);

  @override
  Future<Either<Failure, LoginSuccModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }

      final response = await apiConsumer.post(
        EndPoints.login,
        data: {'phone': phone, 'password': password},
      );

      log('Login response: $response');

      if (response == null ||
          response['data'] == null ||
          response['data']['token'] == null) {
        return Left(AuthFailure(response['message']));
      }

      final String token = response['data']['token'];
      final LoginSuccModel user = LoginSuccModel.fromJson(response['data']);

      await SecureLocalStorage.write(PrefsKeys.token, token);
      await SecureLocalStorage.write(
        PrefsKeys.user,
        jsonEncode(response['data']),
      );

      log(user.toJson().toString());
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
