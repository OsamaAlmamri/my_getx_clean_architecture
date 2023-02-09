import 'package:my_getx_clean_architecture/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required String author, required int id, required String content})
      : super(author: author, id: id, content: content);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        content: json["quote"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": content,
      };
}
