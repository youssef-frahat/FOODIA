import 'package:equatable/equatable.dart';

import 'food.dart';

class Data extends Equatable {
  final Food? food;
  final List<dynamic>? reviews;

  const Data({this.food, this.reviews});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    food:
        json['food'] == null
            ? null
            : Food.fromJson(json['food'] as Map<String, dynamic>),
    reviews: json['reviews'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {'food': food?.toJson(), 'reviews': reviews};

  @override
  List<Object?> get props => [food, reviews];
}
