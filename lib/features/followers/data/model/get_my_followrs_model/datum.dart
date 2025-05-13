import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? otp;
  final int? isVerify;
  final String? image;
  final String? wallet;
  final int? countSubscribe;
  final String? bio;
  final int? totalOrder;
  final dynamic fcmToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Datum({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.otp,
    this.isVerify,
    this.image,
    this.wallet,
    this.countSubscribe,
    this.bio,
    this.totalOrder,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    otp: json['otp'] as String?,
    isVerify: json['is_verify'] as int?,
    image: json['image'] as String?,
    wallet: json['wallet'] as String?,
    countSubscribe: json['countSubscribe'] as int?,
    bio: json['bio'] as String?,
    totalOrder: json['totalOrder'] as int?,
    fcmToken: json['fcm_token'] as dynamic,
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
    'name': name,
    'phone': phone,
    'email': email,
    'otp': otp,
    'is_verify': isVerify,
    'image': image,
    'wallet': wallet,
    'countSubscribe': countSubscribe,
    'bio': bio,
    'totalOrder': totalOrder,
    'fcm_token': fcmToken,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  Datum copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? otp,
    int? isVerify,
    String? image,
    String? wallet,
    int? countSubscribe,
    String? bio,
    int? totalOrder,
    dynamic fcmToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      isVerify: isVerify ?? this.isVerify,
      image: image ?? this.image,
      wallet: wallet ?? this.wallet,
      countSubscribe: countSubscribe ?? this.countSubscribe,
      bio: bio ?? this.bio,
      totalOrder: totalOrder ?? this.totalOrder,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      phone,
      email,
      otp,
      isVerify,
      image,
      wallet,
      countSubscribe,
      bio,
      totalOrder,
      fcmToken,
      createdAt,
      updatedAt,
    ];
  }
}
