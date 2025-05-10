import 'package:equatable/equatable.dart';

import 'category.dart';
import 'chef.dart';

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? rate;
  final String? foodType;
  final int? preparationTime;
  final String? priceBefore;
  final String? priceAfter;
  final int? reviewCount;
  final Category? category;
  final Chef? chef;

  const Food({
    this.id,
    this.name,
    this.image,
    this.rate,
    this.foodType,
    this.preparationTime,
    this.priceBefore,
    this.priceAfter,
    this.reviewCount,
    this.category,
    this.chef,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    rate: json['rate'] as String?,
    foodType: json['food_type'] as String?,
    preparationTime: json['preparation_time'] as int?,
    priceBefore: json['price_before'] as String?,
    priceAfter: json['price_after'] as String?,
    reviewCount: json['review_count'] as int?,
    category:
        json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
    chef:
        json['chef'] == null
            ? null
            : Chef.fromJson(json['chef'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rate': rate,
    'food_type': foodType,
    'preparation_time': preparationTime,
    'price_before': priceBefore,
    'price_after': priceAfter,
    'review_count': reviewCount,
    'category': category?.toJson(),
    'chef': chef?.toJson(),
  };

  Food copyWith({
    int? id,
    String? name,
    String? image,
    String? rate,
    String? foodType,
    int? preparationTime,
    String? priceBefore,
    String? priceAfter,
    int? reviewCount,
    Category? category,
    Chef? chef,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rate: rate ?? this.rate,
      foodType: foodType ?? this.foodType,
      preparationTime: preparationTime ?? this.preparationTime,
      priceBefore: priceBefore ?? this.priceBefore,
      priceAfter: priceAfter ?? this.priceAfter,
      reviewCount: reviewCount ?? this.reviewCount,
      category: category ?? this.category,
      chef: chef ?? this.chef,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      rate,
      foodType,
      preparationTime,
      priceBefore,
      priceAfter,
      reviewCount,
      category,
      chef,
    ];
  }
}
