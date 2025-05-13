import 'package:equatable/equatable.dart';

import 'item.dart';

class Data extends Equatable {
  final List<Item>? items;
  final String? totalPrice;

  const Data({this.items, this.totalPrice});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
    totalPrice: json['total_price'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
    'total_price': totalPrice,
  };

  Data copyWith({List<Item>? items, String? totalPrice}) {
    return Data(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice];
}
