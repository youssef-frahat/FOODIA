import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/chefe_profile_model/chefe_profile_model.dart';
import '../../../data/model/get_all_follors_chefe_model/get_all_follors_chefe_model.dart';
import '../../../data/model/get_foodes_chefe_model/get_foodes_chefe_model.dart';
import '../../../data/repo/get_followers/get_follower_repo_impl.dart';

part 'all_followers_state.dart';

class AllFollowersCubit extends Cubit<AllFollowersState> {
  final GetFollowerRepoImpl getFollowerRepoImpl;

  AllFollowersCubit(this.getFollowerRepoImpl) : super(AllFollowersInitial());

  Future<void> getAllFollowersChefe() async {
    emit(GetAllFollowersChefeLoading());
    final result = await getFollowerRepoImpl.getChefeFollowers();
    result.fold((l) => emit(GetAllFollowersChefeFailure(l.message)), (r) {
      
      emit(GetAllFollowersChefeSuccess(r));
    });
  }

  getFoodsChefe() async {
    emit(GetFoodesChefeLoading());
    final result = await getFollowerRepoImpl.getFoodeChefe();
    result.fold((l) => emit(GetFoodesChefeFailure(l.message)), (r) {
     log("Foods data: ${r.toString()}");

      emit(GetFoodesChefeSuccess(r));
    });
  }


  void getProfileChefe({required int chefId}) async {
    emit(GetProfileChefeLoading());
    final result = await getFollowerRepoImpl.getProfileChefe(cefeId: chefId);
    result.fold(
      (failure) => emit(GetProfileChefeFailure(failure.message)),
      (data) => emit(GetProfileChefeSuccess(data)),
    );
  }
}
