import 'package:equatable/equatable.dart';

class GetProductOptions extends Equatable {
  final String category_id;
  final String search;
  final int favourites;
  final int rows_per_page;
  final int page;

  GetProductOptions(
      {this.category_id = "all",
      this.search = "",
      this.favourites = 0,
      this.rows_per_page = 25,
      this.page = 1});

  @override
  List<Object?> get props => [category_id, search,page,favourites,rows_per_page];
}

