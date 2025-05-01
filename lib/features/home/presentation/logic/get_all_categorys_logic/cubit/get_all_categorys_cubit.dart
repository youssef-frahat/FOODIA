import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/features/home/data/repo/get_all_home_repo_impl.dart';

import '../../../../data/model/get_all_categorys_model/get_all_categorys_model.dart';

part 'get_all_categorys_state.dart';

class GetAllCategorysCubit extends Cubit<GetAllCategorysState> {
  final GetAllHomeRepoImpl getAllHomeRepo;
  GetAllCategorysCubit(this.getAllHomeRepo) : super(GetAllCategorysInitial());

  Future<void> getAllCategorys() async {
    emit(GetAllCategorysLoading());
    final result = await getAllHomeRepo.listAllcategories();
    result.fold(
      (failure) => emit(GetAllCategorysError(failure.message)),
      (categorys) => emit(GetAllCategorysLoaded(categorys)),
    );
  }
}
