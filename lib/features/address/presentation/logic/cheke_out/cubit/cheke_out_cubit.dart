import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../data/model/cheke_out_order_model/cheke_out_order_model.dart';
import '../../../../data/repo/add_adress_repo_impl.dart';

part 'cheke_out_state.dart';

class ChekeOutCubit extends Cubit<ChekeOutState> {
  final AddAdressRepoImpl addAdressRepoImpl;
  ChekeOutCubit(this.addAdressRepoImpl) : super(ChekeOutInitial());

  Future<void> chekeOut({required int adressId}) async {
    emit(ChekeOutLoading());
    final result = await addAdressRepoImpl.chekeOut(adressId: adressId);
    result.fold(
      (l) => emit(ChekeOutFailure(l)),
      (r) => emit(ChekeOutSuccess(r)),
    );
  }
}
