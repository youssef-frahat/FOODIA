import 'dart:convert';

import 'package:equatable/equatable.dart';

class Chef extends Equatable {
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

  const Chef({
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

  factory Chef.fromMap(Map<String, dynamic> data) => Chef(
    id: data['id'] as int?,
    name: data['name'] as String?,
    phone: data['phone'] as String?,
    email: data['email'] as String?,
    otp: data['otp'] as String?,
    isVerify: data['is_verify'] as int?,
    image: data['image'] as String?,
    wallet: data['wallet'] as String?,
    countSubscribe: data['countSubscribe'] as int?,
    bio: data['bio'] as String?,
    totalOrder: data['totalOrder'] as int?,
    fcmToken: data['fcm_token'] as dynamic,
    createdAt:
        data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
    updatedAt:
        data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
  );

  Map<String, dynamic> toMap() => {
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Chef].
  factory Chef.fromJson(String data) {
    return Chef.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Chef] to a JSON string.
  String toJson() => json.encode(toMap());

  Chef copyWith({
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
    return Chef(
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
  bool get stringify => true;

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
