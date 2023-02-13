import 'package:my_getx_clean_architecture/domain/entities/GetProductOptions.dart';

import 'dart:convert';

String GetProductOptionsModelToJson(GetProductOptionsModel data) =>
    json.encode(data.toJson());

class GetProductOptionsModel extends GetProductOptions {
  GetProductOptionsModel({
    String category_id = "all",
    String search = "",
    int favourites = 0,
    int rows_per_page = 20,
    int page = 1,
  }) : super(
            category_id: category_id,
            search: search,
            favourites: favourites,
            rows_per_page: rows_per_page,
            page: page);

  Map<String, dynamic> toJson() => {
        "category_id": category_id,
        "search": search,
        "favourites": favourites,
        "rows_per_page": rows_per_page,
        "page": page,
      };
}
