import 'package:equatable/equatable.dart';

import 'data.dart';

class GetAllFollowersChefeModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const GetAllFollowersChefeModel({this.status, this.message, this.data});

  factory GetAllFollowersChefeModel.fromJson(Map<String, dynamic> json) {
    return GetAllFollowersChefeModel(
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

  GetAllFollowersChefeModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return GetAllFollowersChefeModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
