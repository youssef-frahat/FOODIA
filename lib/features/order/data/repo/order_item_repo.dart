import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/cansele_order_model.dart';
import '../model/get_all_order_response_model/get_all_order_response_model.dart';

abstract class OrderItemRepo {
  Future<Either<Failure, GetAllOrderResponseModel>> getAllOrderItem();
  Future<Either<Failure, CanseleOrderModel>> cancelOrder({
    required int orderId,
  });
}
