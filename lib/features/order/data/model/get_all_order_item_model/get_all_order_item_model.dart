import 'package:equatable/equatable.dart';

import 'order_item.dart';

class GetAllOrderItemModel extends Equatable {
  final List<OrderItem>? orderItems;

  const GetAllOrderItemModel({this.orderItems});

  factory GetAllOrderItemModel.fromJson(Map<String, dynamic> json) {
    return GetAllOrderItemModel(
      orderItems:
          (json['orderItems'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'orderItems': orderItems?.map((e) => e.toJson()).toList(),
  };

  GetAllOrderItemModel copyWith({List<OrderItem>? orderItems}) {
    return GetAllOrderItemModel(orderItems: orderItems ?? this.orderItems);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [orderItems];
}
