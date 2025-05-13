import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';

import '../model/add_to_adress_response_model/add_to_adress_response_model.dart';
import '../model/get_all_adress_user_model/get_all_adress_user_model.dart';
import '../model/get_order_detilas_model/get_order_detilas_model.dart';

abstract class AddAdressRepo {
  Future<Either<Failure, AddToAdressResponseModel>> addToAdress({
    required String city,
    required String center,
    required String neighborhood,
    required String street,
    required String buildingNumber,
  });
  Future<Either<Failure, GetAllAdressUserModel>> getAllAdressUser();
  Future<Either<Failure, GetOrderDetilasModel>> getAllOrderDetails();
}
