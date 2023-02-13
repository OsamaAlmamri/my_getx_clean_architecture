import 'dart:convert';
import 'package:my_getx_clean_architecture/data/models/brand_model.dart';
import 'package:my_getx_clean_architecture/data/models/category_model.dart';
import 'package:my_getx_clean_architecture/data/models/description_lang.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends Product {
  ProductModel({
    required    int id,
    required  int salesCount,
    required  Description name,
    required  Description description,
    required dynamic rating,
    required String image,
    required int price,
    required int available,
    required int minimumFreeDelivery,
    required int isSample,
    required int isOriginal,
    required int isFlash,
    required String discountType,
    required int discountPrice,
    required Category category,
     // Brand? brand,
    required  int sku,
    required  int barcode,
    required  int quantity,
    required int status,
  }) : super(
            id: id,
            salesCount: salesCount,
            name: name,
            description: description,
            rating: rating,
            image: image,
            price: price,
            available: available,
            minimumFreeDelivery: minimumFreeDelivery,
            isSample: isSample,
            isOriginal: isOriginal,
            isFlash: isFlash,
            discountType: discountType,
            discountPrice: discountPrice,
            category: category,
            // brand: brand,
            sku: sku,
            barcode: barcode,
            quantity: quantity,
            status: status);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        salesCount: json["sales_count"],
        name: Description.fromJson(json["name"]),
        description: Description.fromJson(json["description"]),
        rating: json["rating"],
        image: json["image"],
        price: json["price"],
        available: json["available"],
        minimumFreeDelivery: json["minimum_free_delivery"],
        isSample: json["is_sample"],
        isOriginal: json["is_original"],
        isFlash: json["is_flash"],
        discountType: json["discount_type"],
        discountPrice: json["discount_price"],
        category: Category.fromJson(json["category"]),
        // brand: Brand.fromJson(json["brand"]),
        sku: json["sku"],
        barcode: json["barcode"],
        quantity: json["quantity"],
        status: json["status"],

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sales_count": salesCount,
        "name": name.toJson(),
        "description": description.toJson(),
        "rating": rating,
        "image": image,
        "price": price,
        "available": available,
        "minimum_free_delivery": minimumFreeDelivery,
        "is_sample": isSample,
        "is_original": isOriginal,
        "is_flash": isFlash,
        "discount_type": discountType,
        "discount_price": discountPrice,
        "category": category.toJson(),
        // "brand": brand!.toJson(),
        "sku": sku,
        "barcode": barcode,
        "quantity": quantity,
        "status": status,

      };
}
