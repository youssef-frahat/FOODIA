import 'package:equatable/equatable.dart';

import 'food.dart';

class OrderItem extends Equatable {
  final int? id;
  final int? orderId;
  final int? foodId;
  final String? chefStatus;
  final int? qty;
  final String? subtotal;
  final Food? food;

  const OrderItem({
    this.id,
    this.orderId,
    this.foodId,
    this.chefStatus,
    this.qty,
    this.subtotal,
    this.food,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json['id'] as int?,
    orderId: json['order_id'] as int?,
    foodId: json['food_id'] as int?,
    chefStatus: json['chef_status'] as String?,
    qty: json['qty'] as int?,
    subtotal: json['subtotal'] as String?,
    food:
        json['food'] == null
            ? null
            : Food.fromJson(json['food'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'food_id': foodId,
    'chef_status': chefStatus,
    'qty': qty,
    'subtotal': subtotal,
    'food': food?.toJson(),
  };

  OrderItem copyWith({
    int? id,
    int? orderId,
    int? foodId,
    String? chefStatus,
    int? qty,
    String? subtotal,
    Food? food,
  }) {
    return OrderItem(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      foodId: foodId ?? this.foodId,
      chefStatus: chefStatus ?? this.chefStatus,
      qty: qty ?? this.qty,
      subtotal: subtotal ?? this.subtotal,
      food: food ?? this.food,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, orderId, foodId, chefStatus, qty, subtotal, food];
  }
}
