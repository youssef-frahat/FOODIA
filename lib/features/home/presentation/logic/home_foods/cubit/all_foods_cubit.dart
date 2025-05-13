import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/followers/data/model/follow_cefe_model.dart';
import 'package:foodia_app/features/home/data/repo/get_all_home_repo_impl.dart';

import '../../../../data/model/get_all_details_reposne_model/get_all_details_reposne_model.dart';
import '../../../../data/model/get_home_foods_model/datum.dart';

part 'all_foods_state.dart';

class AllFoodsCubit extends Cubit<AllFoodsState> {
  final GetAllHomeRepoImpl getAllHomeRepo;
  AllFoodsCubit(this.getAllHomeRepo) : super(AllFoodsInitial());
  List<FoodsModel> _allFoods = [];
  List<FoodsModel> filteredFoods = [];
  Future<void> getAllFoods({String foodName = ''}) async {
    emit(AllFoodsLoading());
    final result = await getAllHomeRepo.getAllHomeFoods(foodName: foodName);
    result.fold((failure) => emit(AllFoodsError(failure.message)), (model) {
      _allFoods = model.data?.data ?? [];
      filteredFoods = _allFoods;
      emit(AllFoodsLoaded(filteredFoods));
    });
  }

  Future<void> getAllDetalisById({required num foodId}) async {
    emit(AllDetailsLoading());
    final result = await getAllHomeRepo.getAllDetalisById(foodId: foodId);
    result.fold(
      (failure) {
        emit(AllDetailsError(failure.message));
      },
      (getAllDetalisResponseModel) {
        log(
          'GetAllDetalisResponseModel: ${getAllDetalisResponseModel.toString()}',
        );
        emit(AllDetailsSucss(getAllDetalisResponseModel));
      },
    );
  }

  Future<void> followCefe({required num cefeId}) async {
    final result = await getAllHomeRepo.followCefe(cefeId: cefeId);
    result.fold(
      (failure) {
        emit(FollowChefError(failure.message));
      },
      (followCefeModel) {
        emit(FollowChef(followCefeModel));
      },
    );
  }

  void filterByCategory(int categoryId) {
    filteredFoods =
        _allFoods.where((food) => food.categoryId == categoryId).toList();

    emit(AllFoodsLoaded(filteredFoods));
  }

  void resetFilter() {
    filteredFoods = _allFoods;
    emit(AllFoodsLoaded(filteredFoods));
  }
}
