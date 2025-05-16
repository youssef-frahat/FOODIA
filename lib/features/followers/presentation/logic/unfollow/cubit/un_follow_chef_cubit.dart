import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/delete_follow_chefe_model.dart';
import '../../../../data/repo/get_followers/get_follower_repo_impl.dart';

part 'un_follow_chef_state.dart';

class UnFollowChefCubit extends Cubit<UnFollowChefState> {
  final GetFollowerRepoImpl getFollowerRepoImpl;

  UnFollowChefCubit(this.getFollowerRepoImpl) : super(UnFollowChefInitial());

  Future<void> unFollowChef(int chefId) async {
    emit(UnFollowChefLoading());

    final result = await getFollowerRepoImpl.deleteFollowChefe(chefeId: chefId);

    result.fold(
      (failure) {
        emit(UnFollowChefError(failure.message));
      },
      (model) {
        emit(UnFollowChefSuccess(model));
      },
    );
  }
}
