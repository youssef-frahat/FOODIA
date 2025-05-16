import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetMyFollowrsModel extends Equatable {
  final bool? status;
  final String? message;
  final List<Follower>? data;

  const GetMyFollowrsModel({this.status, this.message, this.data});

  factory GetMyFollowrsModel.fromJson(Map<String, dynamic> json) {
    return GetMyFollowrsModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Follower.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  GetMyFollowrsModel copyWith({
    bool? status,
    String? message,
    List<Follower>? data,
  }) {
    return GetMyFollowrsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}
