import 'package:equatable/equatable.dart';

class DeletItemCartModel extends Equatable {
	final bool? status;
	final String? message;
	final dynamic data;

	const DeletItemCartModel({this.status, this.message, this.data});

	factory DeletItemCartModel.fromJson(Map<String, dynamic> json) {
		return DeletItemCartModel(
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
