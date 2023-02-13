
import 'package:my_getx_clean_architecture/data/models/description_lang.dart';

class Category {
  Category({
    required this.id,
    required this.name,
    this.parent,
  });

  int id;
  Description name;
  dynamic parent;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: Description.fromJson(json["name"]),
    parent: json["parent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name.toJson(),
    "parent": parent,
  };
}
