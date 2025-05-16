import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? userId;
  final int? foodId;
  final String? star;
  final String? comment;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const Data({
    this.userId,
    this.foodId,
    this.star,
    this.comment,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json['user_id'] as int?,
    foodId:
        json['food_id'] is int
            ? json['food_id'] as int
            : int.tryParse(json['food_id'].toString()),
    star: json['star'] as String?,
    comment: json['comment'] as String?,
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    id: json['id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'food_id': foodId,
    'star': star,
    'comment': comment,
    'updated_at': updatedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'id': id,
  };

  @override
  List<Object?> get props => [
    userId,
    foodId,
    star,
    comment,
    updatedAt,
    createdAt,
    id,
  ];
}
