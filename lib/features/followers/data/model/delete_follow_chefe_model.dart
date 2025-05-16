import 'package:equatable/equatable.dart';

class DeleteFollowChefeModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic data;

  const DeleteFollowChefeModel({this.status, this.message, this.data});

  factory DeleteFollowChefeModel.fromJson(Map<String, dynamic> json) {
    return DeleteFollowChefeModel(
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

  @override
  List<Object?> get props => [status, message, data];
}
