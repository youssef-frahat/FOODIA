import 'package:equatable/equatable.dart';

class Chef extends Equatable {
	final int? id;
	final String? name;
	final String? image;

	const Chef({this.id, this.name, this.image});

	factory Chef.fromJson(Map<String, dynamic> json) => Chef(
				id: json['id'] as int?,
				name: json['name'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
			};

	@override
	List<Object?> get props => [id, name, image];
}
