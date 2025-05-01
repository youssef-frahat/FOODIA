import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/login/data/repo/login_user_repo_impl.dart';
import '../../features/auth/login/presentation/logic/cubit/login_user_cubit.dart';
import '../../features/auth/otp/data/repo/otp_user_repo_impl.dart';
import '../../features/auth/otp/presentation/logic/cubit/otp_user_cubit.dart';
import '../../features/auth/signin/data/repo/signin_user_repo_impel.dart';
import '../../features/auth/signin/presentation/logic/cubit/signin_user_cubit.dart';
import '../../features/home/data/repo/get_all_home_repo_impl.dart';
import '../../features/home/presentation/logic/get_all_categorys_logic/cubit/get_all_categorys_cubit.dart';
import '../../features/home/presentation/logic/home_foods/cubit/all_foods_cubit.dart';
import '../../features/profile/data/repo/get_user_profile_repo_impl.dart';
import '../../features/profile/presentation/logic/cubit/user_profile_cubit.dart';
import '../networking/api/api_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initExternals(); // تعديل مهم هنا: أصبحت async
  _initRepositories();
  _initCubits();
}

//! Externals
Future<void> _initExternals() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  getIt.registerLazySingleton<ApiService>(() => ApiService());
}

//! Repositories
void _initRepositories() {
  getIt.registerLazySingleton<LoginUserRepoImpl>(() => LoginUserRepoImpl(getIt()));
  getIt.registerLazySingleton<SigninUserRepoImpel>(() => SigninUserRepoImpel(getIt()));
  getIt.registerLazySingleton<OtpUserRepoImpl>(() => OtpUserRepoImpl(getIt())); 
  getIt.registerLazySingleton<GetUserProfileRepoImpl>(() => GetUserProfileRepoImpl(getIt()));
  getIt.registerLazySingleton<GetAllHomeRepoImpl>(() => GetAllHomeRepoImpl(getIt()));
}

//! Cubits
void _initCubits() {
  getIt.registerFactory<LoginUserCubit>(() => LoginUserCubit(getIt()));
  getIt.registerFactory<SigninUserCubit>(() => SigninUserCubit(getIt()));
  getIt.registerFactory<OtpUserCubit>(() => OtpUserCubit(getIt())); 
  getIt.registerFactory<UserProfileCubit>(() => UserProfileCubit(getIt()));
  getIt.registerFactory<GetAllCategorysCubit>(() => GetAllCategorysCubit(getIt()));
  getIt.registerFactory<AllFoodsCubit>(() => AllFoodsCubit(getIt()));
}
