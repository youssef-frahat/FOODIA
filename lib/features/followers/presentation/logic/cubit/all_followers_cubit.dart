import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/chefe_profile_model/chefe_profile_model.dart';
import '../../../data/model/get_my_followrs_model/get_my_followrs_model.dart';
import '../../../data/repo/get_followers/get_follower_repo_impl.dart';

part 'all_followers_state.dart';

class AllFollowersCubit extends Cubit<AllFollowersState> {
  final GetFollowerRepoImpl getFollowerRepoImpl;

  AllFollowersCubit(this.getFollowerRepoImpl) : super(AllFollowersInitial());

  Future<void> fetchFollowers() async {
    emit(AllFollowersLoading());

    final followersResult = await getFollowerRepoImpl.getChefeFollowers();
    followersResult.fold((l) => emit(AllFollowersFailure(l.message)), (r) {
      emit(AllFollowersChefe(r));
    });
  }

  void getProfileChefe({required int chefId}) async {
    emit(GetProfileChefeLoading());
    final result = await getFollowerRepoImpl.getProfileChefe(cefeId: chefId);
    result.fold((failure) {
      emit(GetProfileChefeFailure(failure.message));
      log('GetProfileChefeFailure: ${failure.message}');
    }, (data) => emit(GetProfileChefeSuccess(data)));
  }
}
