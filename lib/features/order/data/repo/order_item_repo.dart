import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/cansele_order_model.dart';
import '../model/get_all_order_item_model/get_all_order_item_model.dart';

abstract class OrderItemRepo {
  Future<Either<Failure, GetAllOrderItemModel>> getAllOrderItem();
  Future<Either<Failure, CanseleOrderModel>> cancelOrder({
    required int orderId,
  });
}
