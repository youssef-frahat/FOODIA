import 'package:equatable/equatable.dart';

import 'category.dart';
import 'chef.dart';

class Food extends Equatable {
  final int? id;
  final Category? category;
  final Chef? chef;
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  final String? offerPrice;
  final String? status;
  final int? preparationTime;
  final String? rating;
  final String? foodType;
  final String? createdAt;
  final String? updatedAt;

  const Food({
    this.id,
    this.category,
    this.chef,
    this.name,
    this.description,
    this.image,
    this.price,
    this.offerPrice,
    this.status,
    this.preparationTime,
    this.rating,
    this.foodType,
    this.createdAt,
    this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'] as int?,
    category:
        json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
    chef:
        json['chef'] == null
            ? null
            : Chef.fromJson(json['chef'] as Map<String, dynamic>),
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    price: json['price'] as String?,
    offerPrice: json['offer_price'] as String?,
    status: json['status'] as String?,
    preparationTime: json['preparation_time'] as int?,
    rating: json['rating'] as String?,
    foodType: json['food_type'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category?.toJson(),
    'chef': chef?.toJson(),
    'name': name,
    'description': description,
    'image': image,
    'price': price,
    'offer_price': offerPrice,
    'status': status,
    'preparation_time': preparationTime,
    'rating': rating,
    'food_type': foodType,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [
      id,
      category,
      chef,
      name,
      description,
      image,
      price,
      offerPrice,
      status,
      preparationTime,
      rating,
      foodType,
      createdAt,
      updatedAt,
    ];
  }
}
