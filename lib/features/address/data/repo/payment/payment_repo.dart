import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../model/payment_response_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, PaymentResponseModel>> makePayment({
    required int orderId,
    required String payment,
  });
}
