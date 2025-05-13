import 'package:dartz/dartz.dart';
import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/helpers/connectivity_helper.dart';
import '../../../../../core/networking/api/api_services.dart';
import '../../../../../core/networking/api/end_points.dart';
import '../../model/payment_response_model.dart';
import 'payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiService apiService;
  PaymentRepoImpl(this.apiService);

  @override
  Future<Either<Failure, PaymentResponseModel>> makePayment({
    required int orderId,
    required String payment,
  }) async {
    try {
      if (!await ConnectivityHelper.connected) {
        return const Left(NetworkFailure(AppStrings.checkInternetConnection));
      }

      final response = await apiService.post(
        '${EndPoints.payOrder}/$orderId',
        data: {'payment': payment},
      );

      if (response['status'] == false) {
        final message = response['error'] ??
                        (response['message'] is String ? response['message'] : null) ??
                        AppStrings.unexpectedError;

        return Left(ServerFailure(message));
      }

      final model = PaymentResponseModel.fromJson(response);
      return Right(model);
      
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('خطأ غير متوقع: $e'));
    }
  }
}
