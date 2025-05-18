import 'package:equatable/equatable.dart';

import 'food.dart';
import 'review.dart';

class Data extends Equatable {
  final Food? food;
  final List<Review>? reviews;
  final bool? followChef;

  const Data({this.food, this.reviews, this.followChef});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        food: json['food'] == null
            ? null
            : Food.fromJson(json['food'] as Map<String, dynamic>),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        followChef: json['followChef'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'food': food?.toJson(),
        'reviews': reviews?.map((e) => e.toJson()).toList(),
        'followChef': followChef,
      };

  @override
  List<Object?> get props => [food, reviews, followChef];
}
