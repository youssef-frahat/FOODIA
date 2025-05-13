part of 'special_offer_cubit.dart';

sealed class SpecialOfferState extends Equatable {
  const SpecialOfferState();

  @override
  List<Object> get props => [];
}

final class SpecialOfferInitial extends SpecialOfferState {}

final class SpecialOfferLoading extends SpecialOfferState {}

final class SpecialOfferLoaded extends SpecialOfferState {
  final SpecialOfferModel offers;

  const SpecialOfferLoaded(this.offers);

  @override
  List<Object> get props => [offers];
}

final class SpecialOfferError extends SpecialOfferState {
  final String message;

  const SpecialOfferError(this.message);

  @override
  List<Object> get props => [message];
}
