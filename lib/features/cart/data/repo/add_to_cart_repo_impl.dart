import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';
import 'package:foodia_app/features/cart/data/repo/add_to_cart_repo.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api/end_points.dart';

class AddToCartRepoImpl implements AddToCartRepo {
  final ApiService apiService;
  AddToCartRepoImpl(this.apiService);
  @override
  Future<Either<Failure, AddToCartModel>> addToCart({
    required int foodId,
    required int quantity,
  }) async {
    try {
      final response = await apiService.post(
        EndPoints.addCart,
        data: {'food_id': foodId, 'qty': quantity},
      );
      return Right(AddToCartModel.fromJson(response.data));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
