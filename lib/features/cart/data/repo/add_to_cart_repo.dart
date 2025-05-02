import 'package:dartz/dartz.dart';
import 'package:foodia_app/features/cart/data/model/add_to_cart_model.dart';
import 'package:foodia_app/features/cart/data/model/get_all_cart_re_model/get_all_cart_re_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AddToCartRepo {
  Future<Either<Failure, AddToCartModel>> addToCart({
    required int foodId,
    required int quantity,
  });

  // Future<Either<Failure, AddToCartModel>> removeFromCart({
  //   required int foodId,
  // });

  Future<Either<Failure, GetAllCartReModel>> getCart();
}
