import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/review_order_model/review_order_model.dart';
import '../../../data/repo/order_item_repo_impl.dart';

part 'review_button_state.dart';

class ReviewButtonCubit extends Cubit<ReviewButtonState> {
  final OrderItemRepoImpl orderItemRepoImpl;
  ReviewButtonCubit(this.orderItemRepoImpl) : super(ReviewButtonInitial());

  Future<void> reviewsOrder({
    required int foodId,
    required String star,
    required String? comment,
  }) async {
    emit(ReviewButtonLoading());
    final response = await orderItemRepoImpl.reviewsOrder(
      foodId: foodId,
      star: star,
      comment: comment,
    );
    response.fold(
     (failure) {
      emit(ReviewButtonError(failure.message)); 
    },
      (reviewResult) {
        if (reviewResult.message!.toLowerCase().contains('already')) {
          emit(OrderItemReviewAlreadyDone(reviewResult.message.toString()));
        } else {
          emit(ReviewButtonSuccess(reviewResult));
        }
      },
    );
  }
}
