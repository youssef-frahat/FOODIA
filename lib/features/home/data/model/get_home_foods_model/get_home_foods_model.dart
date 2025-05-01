import 'package:equatable/equatable.dart';

import 'datum.dart';

class GetHomeFoodsModel extends Equatable {
	final bool? status;
	final String? message;
	final List<FoodsModel>? data;

	const GetHomeFoodsModel({this.status, this.message, this.data});

	factory GetHomeFoodsModel.fromJson(Map<String, dynamic> json) {
		return GetHomeFoodsModel(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => FoodsModel.fromJson(e as Map<String, dynamic>))
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
