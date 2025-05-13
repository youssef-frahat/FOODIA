import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../data/model/get_order_detilas_model/get_order_detilas_model.dart';
import '../../../../data/repo/add_adress_repo_impl.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final AddAdressRepoImpl addAdressRepoImpl;
  OrderCubit(
    this.addAdressRepoImpl,
  ) : super(OrderInitial());
  getOrderDetails()async{
    emit(GetOrderLoading());
     final result = await addAdressRepoImpl.getAllOrderDetails();
    result.fold(
      (l) => emit(GetOrderFailure(l)),
      (r) => emit(GetOrderScuccess(r)),
    );
  }
}
