import 'food.dart';

class Datum {
  int? id;
  int? orderId;
  int? foodId;
  String? chefStatus;
  int? qty;
  String? subtotal;
  Food? food;

  Datum({
    this.id,
    this.orderId,
    this.foodId,
    this.chefStatus,
    this.qty,
    this.subtotal,
    this.food,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
}
