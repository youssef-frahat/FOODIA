import 'package:equatable/equatable.dart';

import 'food.dart';

class Item extends Equatable {
  final Food? food;
  final int? qty;
  final String? pricePerItem;
  final String? subtotal;

  const Item({this.food, this.qty, this.pricePerItem, this.subtotal});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    food:
        json['food'] == null
            ? null
            : Food.fromJson(json['food'] as Map<String, dynamic>),
    qty: json['qty'] as int?,
    pricePerItem: json['price_per_item'] as String?,
    subtotal: json['subtotal'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'food': food?.toJson(),
    'qty': qty,
    'price_per_item': pricePerItem,
    'subtotal': subtotal,
  };

  Item copyWith({
    Food? food,
    int? qty,
    String? pricePerItem,
    String? subtotal,
  }) {
    return Item(
      food: food ?? this.food,
      qty: qty ?? this.qty,
      pricePerItem: pricePerItem ?? this.pricePerItem,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  List<Object?> get props => [food, qty, pricePerItem, subtotal];
}
