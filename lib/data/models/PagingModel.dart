import 'package:my_getx_clean_architecture/domain/entities/paging.dart';

class PagingModel extends Paging {
  PagingModel({
    required int currentPage,
    required int from,
    required int lastPage,
    required String path,
    required int perPage,
    required int to,
    required int total,
  }) : super(
            currentPage: currentPage,
            from: from,
            lastPage: lastPage,
            path: path,
            perPage: perPage,
            to: to,
            total: total);

  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
