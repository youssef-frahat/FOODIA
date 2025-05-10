import 'package:equatable/equatable.dart';

import 'data.dart';

class HomePageModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const HomePageModel({this.status, this.message, this.data});

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data:
        json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };

  HomePageModel copyWith({bool? status, String? message, Data? data}) {
    return HomePageModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, data];
}
