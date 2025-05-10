import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class ChefeProfileModel extends Equatable {
	final bool? status;
	final String? message;
	final Data? data;

	const ChefeProfileModel({this.status, this.message, this.data});

	factory ChefeProfileModel.fromMap(Map<String, dynamic> data) {
		return ChefeProfileModel(
			status: data['status'] as bool?,
			message: data['message'] as String?,
			data: data['data'] == null
						? null
						: Data.fromMap(data['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'status': status,
				'message': message,
				'data': data?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChefeProfileModel].
	factory ChefeProfileModel.fromJson(String data) {
		return ChefeProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ChefeProfileModel] to a JSON string.
	String toJson() => json.encode(toMap());

	ChefeProfileModel copyWith({
		bool? status,
		String? message,
		Data? data,
	}) {
		return ChefeProfileModel(
			status: status ?? this.status,
			message: message ?? this.message,
			data: data ?? this.data,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [status, message, data];
}
