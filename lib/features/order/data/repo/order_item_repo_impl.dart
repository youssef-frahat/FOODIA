import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/order/data/model/cansele_order_model.dart';

import 'package:foodia_app/features/order/data/model/get_all_order_item_model/get_all_order_item_model.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/networking/api/end_points.dart' show EndPoints;
import 'order_item_repo.dart';

class OrderItemRepoImpl implements OrderItemRepo {
  final ApiService apiService;

  OrderItemRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetAllOrderItemModel>> getAllOrderItem() async {
    try {
      final response = await apiService.get(EndPoints.order);
      GetAllOrderItemModel getAllOrderItemModel = GetAllOrderItemModel.fromJson(
        response,
      );
      log(response.toString());
      return Right(getAllOrderItemModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, CanseleOrderModel>> cancelOrder({
    required int orderId,
  }) async {
    try {
      final response = await apiService.get(
        '${EndPoints.cancelOrder}/$orderId',
      );
      CanseleOrderModel canseleOrderModel = CanseleOrderModel.fromJson(
        response,
      );
      return Right(canseleOrderModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(AppStrings.unexpectedError));
    }
  }
}
