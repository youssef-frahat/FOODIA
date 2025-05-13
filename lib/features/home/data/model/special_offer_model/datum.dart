class Datum {
	int? id;
	String? name;
	String? image;
	String? price;
	String? offerPrice;

	Datum({this.id, this.name, this.image, this.price, this.offerPrice});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				name: json['name'] as String?,
				image: json['image'] as String?,
				price: json['price'] as String?,
				offerPrice: json['offer_price'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
				'price': price,
				'offer_price': offerPrice,
			};
}
