import 'package:equatable/equatable.dart';
import 'package:my_getx_clean_architecture/data/models/brand_model.dart';
import 'package:my_getx_clean_architecture/data/models/category_model.dart';
import 'package:my_getx_clean_architecture/data/models/description_lang.dart';

class Product extends Equatable {
  int id;
  int salesCount;
  Description name;
  Description description;
  dynamic rating;
  String image;
  int price;
  int available;
  int minimumFreeDelivery;
  int isSample;
  int isOriginal;
  int isFlash;
  String discountType;
  int discountPrice;
  Category category;
  // Brand? brand;
  int sku;
  int barcode;
  int quantity;
  int status;

  Product(
      {required this.id,
      required this.salesCount,
      required this.name,
      required this.description,
      required this.rating,
      required this.image,
      required this.price,
      required this.available,
      required this.minimumFreeDelivery,
      required this.isSample,
      required this.isOriginal,
      required this.isFlash,
      required this.discountType,
      required this.discountPrice,
      required this.category,
      // required this.brand,
      required this.sku,
      required this.barcode,
      required this.quantity,
      required this.status});

  @override
  List<Object?> get props => [
        id,
        salesCount,
        name,
        description,
        rating,
        image,
        price,
        available,
        minimumFreeDelivery,
        isSample,
        isOriginal,
        isFlash,
        discountType,
        discountPrice,
        category,
        // brand,
        sku,
        barcode,
        quantity,
        status
      ];
}
