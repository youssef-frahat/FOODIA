import 'datum.dart';

class GetFoodesChefeModel {
  bool? status;
  String? message;
  List<FoodesModel>? data;

  GetFoodesChefeModel({this.status, this.message, this.data});

  factory GetFoodesChefeModel.fromJson(Map<String, dynamic> json) {
    return GetFoodesChefeModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FoodesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  GetFoodesChefeModel copyWith({bool? status, String? message, List<FoodesModel>? data}) {
    return GetFoodesChefeModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data, 
    );
  }
}
