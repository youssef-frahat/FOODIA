import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? paymentUrl;
  final int? paymentId;

  const Data({this.paymentUrl, this.paymentId});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentUrl: json['payment_url'] as String?,
    paymentId: json['paymentId'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'payment_url': paymentUrl,
    'paymentId': paymentId,
  };

  Data copyWith({String? paymentUrl, int? paymentId}) {
    return Data(
      paymentUrl: paymentUrl ?? this.paymentUrl,
      paymentId: paymentId ?? this.paymentId,
    );
  }

  @override
  List<Object?> get props => [paymentUrl, paymentId];
}
