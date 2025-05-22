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

  int currentPage = 1;
  bool isLastPage = false;
  bool isLoadingMore = false;

  String _lastQuery = '';

  Future<void> getAllFoods({String foodName = ''}) async {
    if (isLastPage || isLoadingMore) return;

    if (currentPage == 1) emit(AllFoodsLoading());

    isLoadingMore = true;
    _lastQuery = foodName;

    final result = await getAllHomeRepo.getAllHomeFoods(
      foodName: foodName,
      pageNumber: currentPage,
    );

    result.fold(
      (failure) {
        isLoadingMore = false;
        emit(AllFoodsError(failure.message));
      },
      (model) {
        final newFoods = model.data?.data ?? [];

        if (newFoods.isEmpty || newFoods.length < 10) {
          isLastPage = true;
        }

        _allFoods.addAll(newFoods);
        filteredFoods = List.from(_allFoods);

        emit(AllFoodsLoaded(filteredFoods));

        currentPage++;
        isLoadingMore = false;
      },
    );
  }

  void resetPagination() {
    currentPage = 1;
    isLastPage = false;
    _allFoods.clear();
    filteredFoods.clear();
    emit(AllFoodsInitial());
  }

  void loadNextPage() {
    if (!isLastPage && !isLoadingMore) {
      getAllFoods(foodName: _lastQuery);
    }
  }

  Future<void> getAllDetalisById({required num foodId}) async {
    emit(AllDetailsLoading());
    final result = await getAllHomeRepo.getAllDetalisById(foodId: foodId);
    result.fold(
      (failure) => emit(AllDetailsError(failure.message)),
      (getAllDetalisResponseModel) {
        log('GetAllDetalisResponseModel: $getAllDetalisResponseModel');
        emit(AllDetailsSucss(getAllDetalisResponseModel));
      },
    );
  }

  Future<void> followCefe({required num cefeId}) async {
    final result = await getAllHomeRepo.followCefe(cefeId: cefeId);
    result.fold(
      (failure) => emit(FollowChefError(failure.message)),
      (followCefeModel) => emit(FollowChef(followCefeModel)),
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