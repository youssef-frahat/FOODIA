import 'package:equatable/equatable.dart';

import 'food.dart';

class Datum extends Equatable {
  final int? id;
  final int? userId;
  final int? foodId;
  final int? qty;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Food? food;

  const Datum({
    this.id,
    this.userId,
    this.foodId,
    this.qty,
    this.createdAt,
    this.updatedAt,
    this.food,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    foodId: json['food_id'] as int?,
    qty: json['qty'] as int?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    food:
        json['food'] == null
            ? null
            : Food.fromJson(json['food'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'food_id': foodId,
    'qty': qty,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'food': food?.toJson(),
  };

  @override
  List<Object?> get props {
    return [id, userId, foodId, qty, createdAt, updatedAt, food];
  }
}
