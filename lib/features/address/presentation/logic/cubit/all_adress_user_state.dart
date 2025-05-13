part of 'all_adress_user_cubit.dart';

sealed class AllAdressUserState extends Equatable {
  const AllAdressUserState();

  @override
  List<Object> get props => [];
}

final class AllAdressUserInitial extends AllAdressUserState {}

final class AllAdressUserLoading extends AllAdressUserState {}

final class AllAdressUserSuccess extends AllAdressUserState {
  final GetAllAdressUserModel getAllAdressUserModel;
  const AllAdressUserSuccess(this.getAllAdressUserModel);
  @override
  List<Object> get props => [getAllAdressUserModel];
}

final class AddAdressUserSuccess extends AllAdressUserState {
  final AddToAdressResponseModel addAdress;
  const AddAdressUserSuccess(this.addAdress);
  @override
  List<Object> get props => [addAdress];
}

final class AllAdressUserFailure extends AllAdressUserState {
  final Failure failure;
  const AllAdressUserFailure(this.failure);
  @override
  List<Object> get props => [failure];
}



