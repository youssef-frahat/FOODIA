import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/features/address/data/model/add_to_adress_response_model/add_to_adress_response_model.dart';
import 'package:foodia_app/features/address/data/model/cheke_out_order_model/cheke_out_order_model.dart';
import 'package:foodia_app/features/address/data/model/delete_adress_model.dart';
import 'package:foodia_app/features/address/data/model/get_all_adress_user_model/get_all_adress_user_model.dart';
import 'package:foodia_app/features/address/data/model/get_order_detilas_model/get_order_detilas_model.dart';
import 'package:foodia_app/features/address/data/repo/add_adress_repo.dart';

import '../../../../core/app_config/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/connectivity_helper.dart';
import '../../../../core/networking/api/api_services.dart';
import '../../../../core/networking/api/end_points.dart';

class AddAdressRepoImpl implements AddAdressRepo {
  final ApiService apiService;

  AddAdressRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AddToAdressResponseModel>> addToAdress({
    required String city,
    required String center,
    required String neighborhood,
    required String street,
    required String buildingNumber,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.post(
        EndPoints.addAdress,
        data: {
          'city': city,
          'center': center,
          'neighborhood': neighborhood,
          'street': street,
          'building_number': buildingNumber,
        },
      );
      final user = AddToAdressResponseModel.fromJson(response);
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, GetAllAdressUserModel>> getAllAdressUser() async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.get(EndPoints.getAdress);
      GetAllAdressUserModel getAllAdressUserModel =
          GetAllAdressUserModel.fromJson(response);
      return Right(getAllAdressUserModel);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, GetOrderDetilasModel>> getAllOrderDetails() async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.get(EndPoints.orderDetails);
      GetOrderDetilasModel order = GetOrderDetilasModel.fromJson(response);
      return Right(order);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ChekeOutOrderModel>> chekeOut({
    required int adressId,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.post(
        EndPoints.checkout,
        data: {'address_id': adressId},
      );
      final user = ChekeOutOrderModel.fromJson(response);
      log('Adress Id: $adressId');
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, DeleteAdressModel>> deleteAdress({
    required int adressId,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.delete(
        '${EndPoints.deleteAdress}/$adressId',
      );
      log("Delete Adress API Response: $response");

      if (response == null || response['status'] != true) {
        return Left(
          ServerFailure(response['message'] ?? 'Delete Adress failed'),
        );
      }
      final user = DeleteAdressModel.fromJson(response);
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, AddToAdressResponseModel>> updateAdress({
    required int id,
    required String city,
    required String center,
    required String neighborhood,
    required String street,
    required String buildingNumber,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }
      final response = await apiService.post(
        '${EndPoints.updateAdress}/$id',
        data: {
          'city': city,
          'center': center,
          'neighborhood': neighborhood,
          'street': street,
          'building_number': buildingNumber,
          '_method': 'PUT',
        },
      );
      final user = AddToAdressResponseModel.fromJson(response);
      return Right(user);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
