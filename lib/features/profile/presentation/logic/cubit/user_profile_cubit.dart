import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_user_profile_model/get_user_profile_model.dart';
import '../../../data/repo/get_user_profile_repo_impl.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final GetUserProfileRepoImpl getUserProfileRepo;
  UserProfileCubit(this.getUserProfileRepo) : super(UserProfileInitial());

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());

    try {
      final result = await getUserProfileRepo.getUserProfile();

      result.fold(
        (failure) {
          emit(UserProfileError(failure.message));
          log('Error fetching user profile: ${failure.message}');
        },
        (userProfile) {
          emit(UserProfileLoaded(userProfile));
          log('User profile loaded successfully');
        },
      );
    } catch (e) {
      emit(UserProfileError('Unexpected error: ${e.toString()}'));
      log('Unexpected error: $e');
    }
  }
}
