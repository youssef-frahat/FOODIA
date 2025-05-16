import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/payment_response_model.dart';
import '../../../../data/repo/payment/payment_repo_impl.dart';

part 'pay_ment_order_state.dart';

class PayMentOrderCubit extends Cubit<PayMentOrderState> {
  final PaymentRepoImpl paymentRepoImpl;
  PayMentOrderCubit(this.paymentRepoImpl) : super(PayMentOrderInitial());

  Future<void> makePayment({
    required int orderId,
    required String payment,
  }) async {
    emit(PayMentOrderLoading());
    final result = await paymentRepoImpl.makePayment(
      orderId: orderId,
      payment: payment,
    );
    result.fold((l) {
      if (l.message.contains("رصيد غير كافى")) {
        emit(PayMentInsufficientBalance(l.message));
      } else {
        emit(PayMentOrderFailure(l.message));
      }
    }, (r) => emit(PayMentOrderSuccess(r)));
  }
}
