import 'product.dart';

class Paging {
  Paging({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final  int from;
  final  int lastPage;
  final String path;
  final  int perPage;
  final  int to;
  final  int total;
}
