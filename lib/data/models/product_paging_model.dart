import 'dart:convert';

import 'package:my_getx_clean_architecture/data/models/PagingModel.dart';
import 'package:my_getx_clean_architecture/data/models/productModel.dart';

ProductsPagesModel ProductsPagesModelFromJson(String str) => ProductsPagesModel.fromJson(json.decode(str));
String ProductsPagesModelToJson(ProductsPagesModel data) => json.encode(data.toJson());

class ProductsPagesModel {
  ProductsPagesModel({
    required this.data,
    required this.meta,
  });
  List<ProductModel> data;
  PagingModel meta;
  factory ProductsPagesModel.fromJson(Map<String, dynamic> json) {

    return ProductsPagesModel(
    data: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),
    meta: PagingModel.fromJson(json["meta"]),
  );
  }
  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "PagingModel": meta.toJson(),
  };
}

