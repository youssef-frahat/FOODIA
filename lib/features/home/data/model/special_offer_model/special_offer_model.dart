import 'data.dart';

class SpecialOfferModel {
  bool? status;
  String? message;
  Data? data;

  SpecialOfferModel({this.status, this.message, this.data});

  factory SpecialOfferModel.fromJson(Map<String, dynamic> json) {
    return SpecialOfferModel(
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
}
