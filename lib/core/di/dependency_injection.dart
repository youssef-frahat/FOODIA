import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/address/data/repo/add_adress_repo_impl.dart';
import '../../features/address/data/repo/payment/payment_repo_impl.dart';
import '../../features/address/presentation/logic/cheke_out/cubit/cheke_out_cubit.dart';
import '../../features/address/presentation/logic/cubit/all_adress_user_cubit.dart';
import '../../features/address/presentation/logic/order/cubit/order_cubit.dart';
import '../../features/address/presentation/logic/payment/cubit/pay_ment_order_cubit.dart';
import '../../features/auth/forgotPassword/data/repo/forgot_passowrd_repo_impl.dart';
import '../../features/auth/forgotPassword/presentation/logic/forgetPassword/cubit/forget_password_cubit.dart';
import '../../features/auth/login/data/repo/login_user_repo_impl.dart';
import '../../features/auth/login/presentation/logic/cubit/login_user_cubit.dart';
import '../../features/auth/otp/data/repo/otp_user_repo_impl.dart';
import '../../features/auth/otp/presentation/logic/cubit/otp_user_cubit.dart';
import '../../features/auth/signin/data/repo/signin_user_repo_impel.dart';
import '../../features/auth/signin/presentation/logic/cubit/signin_user_cubit.dart';
import '../../features/cart/data/repo/add_to_cart_repo_impl.dart';
import '../../features/cart/presentation/logic/cubit/add_to_cart_cubit.dart';
import '../../features/followers/data/repo/get_followers/get_follower_repo_impl.dart';
import '../../features/followers/presentation/logic/cubit/all_followers_cubit.dart';
import '../../features/followers/presentation/logic/unfollow/cubit/un_follow_chef_cubit.dart';
import '../../features/home/data/repo/get_all_home_repo_impl.dart';
import '../../features/home/data/repo/special_offer_repo/special_offer_repo_impl.dart';
import '../../features/home/presentation/logic/get_all_categorys_logic/cubit/get_all_categorys_cubit.dart';
import '../../features/home/presentation/logic/home_foods/cubit/all_foods_cubit.dart';
import '../../features/home/presentation/logic/reviews/cubit/reviews_cubit.dart';
import '../../features/home/presentation/logic/special_offer/cubit/special_offer_cubit.dart';
import '../../features/order/data/repo/order_item_repo_impl.dart';
import '../../features/order/presentation/logic/cubit/order_item_cubit.dart';
import '../../features/profile/data/repo/get_user_profile_repo_impl.dart';
import '../../features/profile/presentation/logic/cubit/user_profile_cubit.dart';
import '../../features/wallet/data/repo/walet_repo_impl.dart';
import '../../features/wallet/presentation/logic/cubit/get_balance_cubit.dart';
import '../networking/api/api_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initExternals();
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
  getIt.registerLazySingleton<LoginUserRepoImpl>(
    () => LoginUserRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<SigninUserRepoImpel>(
    () => SigninUserRepoImpel(getIt()),
  );
  getIt.registerLazySingleton<OtpUserRepoImpl>(() => OtpUserRepoImpl(getIt()));
  getIt.registerLazySingleton<GetUserProfileRepoImpl>(
    () => GetUserProfileRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<GetAllHomeRepoImpl>(
    () => GetAllHomeRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<AddToCartRepoImpl>(
    () => AddToCartRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<AddAdressRepoImpl>(
    () => AddAdressRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<GetFollowerRepoImpl>(
    () => GetFollowerRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<OrderItemRepoImpl>(
    () => OrderItemRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<PaymentRepoImpl>(() => PaymentRepoImpl(getIt()));
  getIt.registerLazySingleton<WaletRepoImpl>(() => WaletRepoImpl(getIt()));
  getIt.registerLazySingleton<SpecialOfferRepoImpl>(
    () => SpecialOfferRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<ForgotPassowrdRepoImpl>(
    () => ForgotPassowrdRepoImpl(getIt()),
  );
}

//! Cubits
void _initCubits() {
  getIt.registerFactory<LoginUserCubit>(() => LoginUserCubit(getIt()));
  getIt.registerFactory<SigninUserCubit>(() => SigninUserCubit(getIt()));
  getIt.registerFactory<OtpUserCubit>(() => OtpUserCubit(getIt()));
  getIt.registerFactory<UserProfileCubit>(() => UserProfileCubit(getIt()));
  getIt.registerFactory<GetAllCategorysCubit>(
    () => GetAllCategorysCubit(getIt()),
  );
  getIt.registerFactory<AllFoodsCubit>(() => AllFoodsCubit(getIt()));
  getIt.registerFactory<AddToCartCubit>(() => AddToCartCubit(getIt()));
  getIt.registerFactory<AllAdressUserCubit>(() => AllAdressUserCubit(getIt()));
  getIt.registerFactory<AllFollowersCubit>(() => AllFollowersCubit(getIt()));
  getIt.registerFactory<OrderItemCubit>(() => OrderItemCubit(getIt()));
  getIt.registerFactory<GetBalanceCubit>(() => GetBalanceCubit(getIt()));
  getIt.registerFactory<SpecialOfferCubit>(() => SpecialOfferCubit(getIt()));
  getIt.registerFactory<OrderCubit>(() => OrderCubit(getIt()));
  getIt.registerFactory<ChekeOutCubit>(() => ChekeOutCubit(getIt()));
  getIt.registerFactory<ReviewsCubit>(() => ReviewsCubit(getIt()));
  getIt.registerFactory<PayMentOrderCubit>(() => PayMentOrderCubit(getIt()));
  getIt.registerFactory<UnFollowChefCubit>(() => UnFollowChefCubit(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(getIt()),
  );
}
