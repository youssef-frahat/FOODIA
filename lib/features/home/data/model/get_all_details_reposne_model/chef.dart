import 'package:equatable/equatable.dart';

class Chef extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final int? countSubscribe;
  final String? wallet;
  final String? bio;
  final int? totalOrder;
  final String? otp;
  final String? image;
  final dynamic token;

  const Chef({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.countSubscribe,
    this.wallet,
    this.bio,
    this.totalOrder,
    this.otp,
    this.image,
    this.token,
  });

  factory Chef.fromJson(Map<String, dynamic> json) => Chef(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    countSubscribe: json['countSubscribe'] as int?,
    wallet: json['wallet'] as String?,
    bio: json['bio'] as String?,
    totalOrder: json['totalOrder'] as int?,
    otp: json['otp'] as String?,
    image: json['image'] as String?,
    token: json['token'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'countSubscribe': countSubscribe,
    'wallet': wallet,
    'bio': bio,
    'totalOrder': totalOrder,
    'otp': otp,
    'image': image,
    'token': token,
  };

  @override
  List<Object?> get props {
    return [
      name,
      phone,
      email,
      countSubscribe,
      wallet,
      bio,
      totalOrder,
      otp,
      image,
      token,
    ];
  }
}
