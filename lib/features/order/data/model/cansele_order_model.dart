import 'package:equatable/equatable.dart';

class CanseleOrderModel extends Equatable {
  final String? message;
  final int? wallet;

  const CanseleOrderModel({this.message, this.wallet});

  factory CanseleOrderModel.fromJson(Map<String, dynamic> json) {
    return CanseleOrderModel(
      message: json['message'] as String?,
      wallet: json['wallet'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'wallet': wallet};

  CanseleOrderModel copyWith({String? message, int? wallet}) {
    return CanseleOrderModel(
      message: message ?? this.message,
      wallet: wallet ?? this.wallet,
    );
  }

  @override
  List<Object?> get props => [message, wallet];
}
