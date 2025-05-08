import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/wallet/data/model/get_wallet_model/get_wallet_model.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api/end_points.dart';
import 'wallet_repo.dart';

class WaletRepoImpl implements WalletRepo {

  final ApiService apiServices;

  WaletRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, GetWalletModel>> getBalance() async{
    try {
      final response = await apiServices.get(EndPoints.balance);
      GetWalletModel balance = GetWalletModel.fromJson(
        response,
      );
      return Right(balance);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  
}