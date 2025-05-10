import 'package:equatable/equatable.dart';

class OfferFood extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? price;
  final String? offerPrice;

  const OfferFood({
    this.id,
    this.name,
    this.image,
    this.price,
    this.offerPrice,
  });

  factory OfferFood.fromJson(Map<String, dynamic> json) => OfferFood(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    price: json['price'] as String?,
    offerPrice: json['offer_price'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'offer_price': offerPrice,
  };

  OfferFood copyWith({
    int? id,
    String? name,
    String? image,
    String? price,
    String? offerPrice,
  }) {
    return OfferFood(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, image, price, offerPrice];
}
