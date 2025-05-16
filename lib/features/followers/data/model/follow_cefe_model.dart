import 'package:equatable/equatable.dart';

class FollowCefeModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic data;

  const FollowCefeModel({this.status, this.message, this.data});

  factory FollowCefeModel.fromJson(Map<String, dynamic> json) {
    return FollowCefeModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data,
  };

  FollowCefeModel copyWith({bool? status, String? message, dynamic data}) {
    return FollowCefeModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
