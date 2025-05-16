import 'package:equatable/equatable.dart';

class DeleteAdressModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic data;

  const DeleteAdressModel({this.status, this.message, this.data});

  factory DeleteAdressModel.fromJson(Map<String, dynamic> json) {
    return DeleteAdressModel(
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
