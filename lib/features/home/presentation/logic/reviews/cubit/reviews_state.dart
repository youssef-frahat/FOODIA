part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final ReviewOrderModel review;

  const ReviewsSuccess(this.review);

  @override
  List<Object> get props => [review];
}

final class ReviewsFailure extends ReviewsState {
  final String error;

  const ReviewsFailure(this.error);

  @override
  List<Object> get props => [error];
}
