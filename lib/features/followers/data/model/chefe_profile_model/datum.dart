import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
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

  const Datum({
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

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['id'] as int?,
    categoryId: data['category_id'] as int?,
    chefId: data['chef_id'] as int?,
    name: data['name'] as String?,
    description: data['description'] as String?,
    image: data['image'] as String?,
    price: data['price'] as String?,
    offerPrice: data['offer_price'] as String?,
    status: data['status'] as String?,
    foodType: data['food_type'] as String?,
    preparationTime: data['preparation_time'] as int?,
    rating: data['rating'] as String?,
    createdAt:
        data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
    updatedAt:
        data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
  );

  Map<String, dynamic> toMap() => {
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
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
    return Datum(
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
  bool get stringify => true;

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
