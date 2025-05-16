import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/review_order_model/review_order_model.dart';
import '../../../../data/repo/get_all_home_repo_impl.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final GetAllHomeRepoImpl repository;

  ReviewsCubit(this.repository) : super(ReviewsInitial());

  Future<void> submitReview({
    required int foodId,
    required String star,
    required String comment,
  }) async {
    emit(ReviewsLoading());

    final result = await repository.submitReview(
  
      foodId: foodId,
      star: star,
      comment: comment,
    );

    result.fold(
      (failure) {
        emit(ReviewsFailure(failure.message));
      },
      (reviewOrderModel) {
        emit(ReviewsSuccess(reviewOrderModel));
      },
    );
  }
}
