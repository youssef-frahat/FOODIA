import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final int? userId;
  final String? city;
  final String? center;
  final String? neighborhood;
  final String? street;
  final String? buildingNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Datum({
    this.id,
    this.userId,
    this.city,
    this.center,
    this.neighborhood,
    this.street,
    this.buildingNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    city: json['city'] as String?,
    center: json['center'] as String?,
    neighborhood: json['neighborhood'] as String?,
    street: json['street'] as String?,
    buildingNumber: json['building_number'] as String?,
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
    'user_id': userId,
    'city': city,
    'center': center,
    'neighborhood': neighborhood,
    'street': street,
    'building_number': buildingNumber,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      city,
      center,
      neighborhood,
      street,
      buildingNumber,
      createdAt,
      updatedAt,
    ];
  }
}
