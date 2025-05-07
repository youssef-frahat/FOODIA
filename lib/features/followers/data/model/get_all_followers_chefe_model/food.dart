import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final int? id;
  final int? categoryId;
  final int? chefId;
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  final String? offerPrice;
  final String? status;
  final String? foodType;
  final int? preparationTime;
  final String? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FoodModel({
    this.id,
    this.categoryId,
    this.chefId,
    this.name,
    this.description,
    this.image,
    this.price,
    this.offerPrice,
    this.status,
    this.foodType,
    this.preparationTime,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    id: json['id'] as int?,
    categoryId: json['category_id'] as int?,
    chefId: json['chef_id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    price: json['price'] as String?,
    offerPrice: json['offer_price'] as String?,
    status: json['status'] as String?,
    foodType: json['food_type'] as String?,
    preparationTime: json['preparation_time'] as int?,
    rating: json['rating'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category_id': categoryId,
    'chef_id': chefId,
    'name': name,
    'description': description,
    'image': image,
    'price': price,
    'offer_price': offerPrice,
    'status': status,
    'food_type': foodType,
    'preparation_time': preparationTime,
    'rating': rating,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  FoodModel copyWith({
    int? id,
    int? categoryId,
    int? chefId,
    String? name,
    String? description,
    String? image,
    String? price,
    String? offerPrice,
    String? status,
    String? foodType,
    int? preparationTime,
    String? rating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      chefId: chefId ?? this.chefId,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      status: status ?? this.status,
      foodType: foodType ?? this.foodType,
      preparationTime: preparationTime ?? this.preparationTime,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      categoryId,
      chefId,
      name,
      description,
      image,
      price,
      offerPrice,
      status,
      foodType,
      preparationTime,
      rating,
      createdAt,
      updatedAt,
    ];
  }
}
