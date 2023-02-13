import 'package:my_getx_clean_architecture/data/models/description_lang.dart';

class Brand {
  Brand({
    required this.id,
    required this.products,
    required this.name,
    required this.image,
  });

  int id;
  int products;
  Description name;
  String image;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(

    id: json["id"],
    products: json["products"],
    name: Description.fromJson(json["name"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": products,
    "name": name.toJson(),
    "image": image,
  };
}
