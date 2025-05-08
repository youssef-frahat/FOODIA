import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const Food({this.id, this.name, this.image});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};

  Food copyWith({int? id, String? name, String? image}) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, image];
}
