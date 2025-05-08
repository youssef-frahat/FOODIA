import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final int? id;
  final int? userId;
  final String? amount;
  final String? status;
  final String? type;
  final DateTime? createdAt;
  final String? fullName;

  const Wallet({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.type,
    this.createdAt,
    this.fullName,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    amount: json['amount'] as String?,
    status: json['status'] as String?,
    type: json['type'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    fullName: json['full_name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'amount': amount,
    'status': status,
    'type': type,
    'created_at': createdAt?.toIso8601String(),
    'full_name': fullName,
  };

  Wallet copyWith({
    int? id,
    int? userId,
    String? amount,
    String? status,
    String? type,
    DateTime? createdAt,
    String? fullName,
  }) {
    return Wallet(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      fullName: fullName ?? this.fullName,
    );
  }

  @override
  List<Object?> get props {
    return [id, userId, amount, status, type, createdAt, fullName];
  }
}
