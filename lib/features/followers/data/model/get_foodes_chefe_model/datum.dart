class FoodesModel {
  int? id;
  int? categoryId;
  int? chefId;
  String? name;
  String? description;
  String? image;
  String? price;
  String? offerPrice;
  String? status;
  String? foodType;
  int? preparationTime;
  String? rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  FoodesModel({
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

  factory FoodesModel.fromJson(Map<String, dynamic> json) => FoodesModel(
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
}
