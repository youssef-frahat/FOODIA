import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_all_followers_chefe_model/chef.dart';
import '../../../data/model/get_all_followers_chefe_model/food.dart';
import '../../../data/model/get_all_followers_chefe_model/get_all_followers_chefe_model.dart';
import '../../../data/repo/get_followers/get_follower_repo_impl.dart';

part 'all_followers_state.dart';

class AllFollowersCubit extends Cubit<AllFollowersState> {
  final GetFollowerRepoImpl getFollowerRepoImpl;
  List<Chef> _chefs = [];
  List<FoodModel> _allFoods = [];

  int? selectedChefId;

  AllFollowersCubit(this.getFollowerRepoImpl) : super(AllFollowersInitial());

  Future<void> getAllFollowersChefe() async {
    emit(GetAllFollowersChefeLoading());
    final result = await getFollowerRepoImpl.getFollowers();
    result.fold(
      (l) => emit(GetAllFollowersChefeFailure(l.message)),
      (r) {
        _chefs = r.data?.chefs ?? [];
        _allFoods = r.data?.foods ?? [];
        emit(GetAllFollowersChefeSuccess(r));
      },
    );
  }

  void selectChef(int chefId) {
    selectedChefId = chefId;
    emit(SelectedChefChanged(getFoodsForChef(chefId)));
  }

  List<FoodModel> getFoodsForChef(int chefId) {
    return _allFoods.where((food) => food.chefId == chefId).toList();
  }
}
