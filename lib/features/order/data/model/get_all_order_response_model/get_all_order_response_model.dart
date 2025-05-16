import 'datum.dart';

class GetAllOrderResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  GetAllOrderResponseModel({this.status, this.message, this.data});

  factory GetAllOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllOrderResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
