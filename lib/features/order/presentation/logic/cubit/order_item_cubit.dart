import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/cansele_order_model.dart';
import '../../../data/model/get_all_order_response_model/get_all_order_response_model.dart';
import '../../../data/model/review_order_model/review_order_model.dart';
import '../../../data/repo/order_item_repo_impl.dart';

part 'order_item_state.dart';

class OrderItemCubit extends Cubit<OrderItemState> {
  final OrderItemRepoImpl orderItemRepoImpl;
  OrderItemCubit(this.orderItemRepoImpl) : super(OrderItemInitial());

  Future<void> getAllOrderItem() async {
    emit(OrderItemLoading());
    final response = await orderItemRepoImpl.getAllOrderItem();
    response.fold(
      (l) => emit(OrderItemError(l.message)),
      (r) => emit(OrderItemLoaded(r)),
    );
  }

  Future<void> cancelOrder({required int orderId}) async {
    emit(OrderItemCancelLoading());
    final response = await orderItemRepoImpl.cancelOrder(orderId: orderId);
    response.fold(
      (l) => emit(OrderItemCancelError(l.message)),
      (r) => emit(OrderItemCancelSuccess(r)),
    );
  }


 Future<void> reviewsOrder({
    required int foodId,
    required String star,
    required String? comment,
  }) async {
    emit(OrderItemReviewLoading());
    final response = await orderItemRepoImpl.reviewsOrder(
      foodId: foodId,
      star: star,
      comment: comment,
    );
    response.fold(
      (failure) => emit(OrderItemReviewError(failure.message)),
      (reviewResult) {
        if (reviewResult.message!.toLowerCase().contains('already')) {
          emit(OrderItemReviewAlreadyDone(reviewResult.message.toString()));
        } else {
          emit(OrderItemReviewSuccess(reviewResult));
        }
      },
    );
  }
}
