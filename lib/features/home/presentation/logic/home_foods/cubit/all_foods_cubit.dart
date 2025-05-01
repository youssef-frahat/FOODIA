import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/home/data/repo/get_all_home_repo_impl.dart';

import '../../../../data/model/get_home_foods_model/get_home_foods_model.dart';

part 'all_foods_state.dart';

class AllFoodsCubit extends Cubit<AllFoodsState> {
  final GetAllHomeRepoImpl getAllHomeRepo;
  AllFoodsCubit(this.getAllHomeRepo) : super(AllFoodsInitial());

  Future<void> getAllHomeFoods({required String foodName}) async {
    emit(AllFoodsLoading());
    final result = await getAllHomeRepo.getAllHomeFoods(foodName: foodName);
    result.fold(
      (failure) {
        emit(AllFoodsError(failure.message));
      },
      (getHomeFoodsModel) {
        emit(AllFoodsLoaded(getHomeFoodsModel));
      },
    );
  }
}
