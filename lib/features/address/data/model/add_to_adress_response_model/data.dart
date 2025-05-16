import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? city;
  final String? center;
  final String? neighborhood;
  final String? street;
  final String? buildingNumber;
  final int? userId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const Data({
    this.city,
    this.center,
    this.neighborhood,
    this.street,
    this.buildingNumber,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    city: json['city'] as String?,
    center: json['center'] as String?,
    neighborhood: json['neighborhood'] as String?,
    street: json['street'] as String?,
    buildingNumber: json['building_number'] as String?,
    userId: json['user_id'] as int?,
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
    'city': city,
    'center': center,
    'neighborhood': neighborhood,
    'street': street,
    'building_number': buildingNumber,
    'user_id': userId,
    'updated_at': updatedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'id': id,
  };

  @override
  List<Object?> get props {
    return [
      city,
      center,
      neighborhood,
      street,
      buildingNumber,
      userId,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
