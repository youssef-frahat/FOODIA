import 'package:equatable/equatable.dart';

import 'category.dart';
import 'food.dart';
import 'offer_food.dart';

class Data extends Equatable {
  final List<Category>? categories;
  final List<Food>? foods;
  final List<OfferFood>? offerFoods;

  const Data({this.categories, this.foods, this.offerFoods});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories:
        (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
    foods:
        (json['foods'] as List<dynamic>?)
            ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
            .toList(),
    offerFoods:
        (json['offerFoods'] as List<dynamic>?)
            ?.map((e) => OfferFood.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
    'foods': foods?.map((e) => e.toJson()).toList(),
    'offerFoods': offerFoods?.map((e) => e.toJson()).toList(),
  };

  Data copyWith({
    List<Category>? categories,
    List<Food>? foods,
    List<OfferFood>? offerFoods,
  }) {
    return Data(
      categories: categories ?? this.categories,
      foods: foods ?? this.foods,
      offerFoods: offerFoods ?? this.offerFoods,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [categories, foods, offerFoods];
}
