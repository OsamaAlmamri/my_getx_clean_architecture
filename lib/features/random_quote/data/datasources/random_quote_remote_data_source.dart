import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/api_consumer.dart';
import 'package:my_getx_clean_architecture/core/api/dio_consumer.dart';
import 'package:my_getx_clean_architecture/core/api/end_points.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  DioConsumer apiConsumer=Get.find();


  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
    );
    return QuoteModel.fromJson(response);
  }
}
