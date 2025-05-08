import 'package:equatable/equatable.dart';

import 'balance.dart';
import 'wallet.dart';

class Data extends Equatable {
  final List<Wallet>? wallets;
  final Balance? balance;

  const Data({this.wallets, this.balance});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallets:
        (json['wallets'] as List<dynamic>?)
            ?.map((e) => Wallet.fromJson(e as Map<String, dynamic>))
            .toList(),
    balance:
        json['balance'] == null
            ? null
            : Balance.fromJson(json['balance'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'wallets': wallets?.map((e) => e.toJson()).toList(),
    'balance': balance?.toJson(),
  };

  Data copyWith({List<Wallet>? wallets, Balance? balance}) {
    return Data(
      wallets: wallets ?? this.wallets,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [wallets, balance];
}
