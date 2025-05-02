import 'package:dartz/dartz.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AddToCartRepo {
  Future<Either<Failure, AddToCartModel>> addToCart({
    required int foodId,
    required int quantity,
  });
}
