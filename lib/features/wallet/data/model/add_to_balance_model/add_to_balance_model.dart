import 'package:equatable/equatable.dart';

import 'data.dart';

class AddToBalanceModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const AddToBalanceModel({this.status, this.message, this.data});

  factory AddToBalanceModel.fromJson(Map<String, dynamic> json) {
    return AddToBalanceModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  AddToBalanceModel copyWith({bool? status, String? message, Data? data}) {
    return AddToBalanceModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
