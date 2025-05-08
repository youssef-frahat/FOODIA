import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  final String? amount;

  const Balance({this.amount});

  factory Balance.fromJson(Map<String, dynamic> json) =>
      Balance(amount: json['amount'] as String?);

  Map<String, dynamic> toJson() => {'amount': amount};

  Balance copyWith({String? amount}) {
    return Balance(amount: amount ?? this.amount);
  }

  @override
  List<Object?> get props => [amount];
}
