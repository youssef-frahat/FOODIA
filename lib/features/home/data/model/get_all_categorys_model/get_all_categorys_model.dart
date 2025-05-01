import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetAllCategorysModel extends Equatable {
	final bool? status;
	final String? message;
	final List<ListAllcategories>? data;

	const GetAllCategorysModel({this.status, this.message, this.data});

	factory GetAllCategorysModel.fromJson(Map<String, dynamic> json) {
		return GetAllCategorysModel(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => ListAllcategories.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [status, message, data];
}
