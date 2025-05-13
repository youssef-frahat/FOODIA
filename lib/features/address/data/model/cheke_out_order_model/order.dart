import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int? userId;
  final int? addressId;
  final int? totalPrice;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const Order({
    this.userId,
    this.addressId,
    this.totalPrice,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    userId: json['user_id'] as int?,
    addressId: json['address_id'] as int?,
    totalPrice: json['total_price'] as int?,
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    id: json['id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'address_id': addressId,
    'total_price': totalPrice,
    'updated_at': updatedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'id': id,
  };

  Order copyWith({
    int? userId,
    int? addressId,
    int? totalPrice,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return Order(
      userId: userId ?? this.userId,
      addressId: addressId ?? this.addressId,
      totalPrice: totalPrice ?? this.totalPrice,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props {
    return [userId, addressId, totalPrice, updatedAt, createdAt, id];
  }
}
