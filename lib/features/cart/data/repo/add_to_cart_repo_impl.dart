import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';
import 'package:foodia_app/features/cart/data/model/delet_item_cart_model.dart';
import 'package:foodia_app/features/cart/data/model/get_all_cart_re_model/get_all_cart_re_model.dart';
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
      final cartResponse = await apiService.get(EndPoints.getCart);

      final List<dynamic> items = cartResponse['data'] ?? [];

      final alreadyInCart = items.any((item) => item['food_id'] == foodId);

      if (alreadyInCart) {
        return Left(ServerFailure('هذا المنتج مضاف بالفعل إلى السلة'));
      }

      final response = await apiService.post(
        EndPoints.addCart,
        data: {'food_id': foodId, 'qty': quantity},
      );

      return Right(AddToCartModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, GetAllCartReModel>> getCart() async {
    try {
      final response = await apiService.get(EndPoints.getCart);
      return Right(GetAllCartReModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, DeletItemCartModel>> deleteItemFromCart({
    required int foodId,
  }) async {
    try {
      final response = await apiService.delete(
        '${EndPoints.deleteCart}/$foodId',
      );
      return Right(DeletItemCartModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
