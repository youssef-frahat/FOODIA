import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodia_app/features/address/data/model/add_to_adress_response_model/add_to_adress_response_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/model/get_all_adress_user_model/get_all_adress_user_model.dart';
import '../../../data/repo/add_adress_repo_impl.dart';

part 'all_adress_user_state.dart';

class AllAdressUserCubit extends Cubit<AllAdressUserState> {
  final AddAdressRepoImpl addAdressRepoImpl;
  AllAdressUserCubit(this.addAdressRepoImpl) : super(AllAdressUserInitial());

  Future<void> getAllAdressUser() async {
    emit(AllAdressUserLoading());
    final result = await addAdressRepoImpl.getAllAdressUser();
    result.fold(
      (l) => emit(AllAdressUserFailure(l)),
      (r) => emit(AllAdressUserSuccess(r)),
    );
  }

  Future<void> addToAdress({
    required String city,
    required String center,
    required String neighborhood,
    required String street,
    required String buildingNumber,
  }) async {
    emit(AllAdressUserLoading());
    final result = await addAdressRepoImpl.addToAdress(
      city: city,
      center: center,
      neighborhood: neighborhood,
      street: street,
      buildingNumber: buildingNumber,
    );
    result.fold(
      (l) => emit(AllAdressUserFailure(l)),
      (r) => emit(AddAdressUserSuccess(r)),
    );
  }


  
}
