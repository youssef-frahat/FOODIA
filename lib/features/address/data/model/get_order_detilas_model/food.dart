import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final int? id;
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

  Food copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? price,
    String? offerPrice,
    String? status,
    int? preparationTime,
    String? rating,
    String? foodType,
    String? createdAt,
    String? updatedAt,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      status: status ?? this.status,
      preparationTime: preparationTime ?? this.preparationTime,
      rating: rating ?? this.rating,
      foodType: foodType ?? this.foodType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
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
