import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/special_offer_model/special_offer_model.dart';
import '../../../../data/repo/special_offer_repo/special_offer_repo_impl.dart';

part 'special_offer_state.dart';

class SpecialOfferCubit extends Cubit<SpecialOfferState> {
  final SpecialOfferRepoImpl repo;

  SpecialOfferCubit(this.repo) : super(SpecialOfferInitial());

  Future<void> getSpecialOffers() async {
    emit(SpecialOfferLoading());
    final result = await repo.specialOffers();
    result.fold(
      (l) => emit(SpecialOfferError(l.message)),
      (r) => emit(SpecialOfferLoaded(r)),
    );
  }
}
