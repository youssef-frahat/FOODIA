import 'package:equatable/equatable.dart';

import 'chef.dart';
import 'food.dart';

class Data extends Equatable {
  final List<Chef>? chefs;
  final List<FoodModel>? foods;

  const Data({this.chefs, this.foods});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    chefs:
        (json['chefs'] as List<dynamic>?)
            ?.map((e) => Chef.fromJson(e as Map<String, dynamic>))
            .toList(),
    foods:
        (json['foods'] as List<dynamic>?)
            ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'chefs': chefs?.map((e) => e.toJson()).toList(),
    'foods': foods?.map((e) => e.toJson()).toList(),
  };

  Data copyWith({List<Chef>? chefs, List<FoodModel>? foods}) {
    return Data(chefs: chefs ?? this.chefs, foods: foods ?? this.foods);
  }

  @override
  List<Object?> get props => [chefs, foods];
}
