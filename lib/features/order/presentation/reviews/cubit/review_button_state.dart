part of 'review_button_cubit.dart';

abstract class ReviewButtonState extends Equatable {
  const ReviewButtonState();

  @override
  List<Object?> get props => [];
}

class ReviewButtonInitial extends ReviewButtonState {}

class ReviewButtonLoading extends ReviewButtonState {}

class ReviewButtonSuccess extends ReviewButtonState {
  final ReviewOrderModel review;
  const ReviewButtonSuccess(this.review);

  @override
  List<Object?> get props => [review];
}

class ReviewButtonError extends ReviewButtonState {
  final String message;
  const ReviewButtonError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderItemReviewAlreadyDone extends ReviewButtonState {
  final String message;
  const OrderItemReviewAlreadyDone(this.message);

  @override
  List<Object?> get props => [message];
}
