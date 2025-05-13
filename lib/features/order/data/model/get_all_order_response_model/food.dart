class Food {
  int? id;
  String? name;
  String? image;

  Food({this.id, this.name, this.image});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}
