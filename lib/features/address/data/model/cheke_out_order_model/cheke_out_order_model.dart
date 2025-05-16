import 'package:equatable/equatable.dart';

import 'data.dart';

class ChekeOutOrderModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const ChekeOutOrderModel({this.status, this.message, this.data});

  factory ChekeOutOrderModel.fromJson(Map<String, dynamic> json) {
    return ChekeOutOrderModel(
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

  ChekeOutOrderModel copyWith({bool? status, String? message, Data? data}) {
    return ChekeOutOrderModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
