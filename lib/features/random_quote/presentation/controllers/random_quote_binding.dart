import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_controller.dart';

class RandomQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RandomQuoteController(getRandomQuoteUseCase: Get.find()));
    Get.lazyPut(() => GetRandomQuote(quoteRepository: Get.find()));
    Get.lazyPut(() => QuoteRepositoryImpl());
    Get.lazyPut(() => RandomQuoteLocalDataSourceImpl());
    Get.lazyPut(() => RandomQuoteRemoteDataSourceImpl());

  }
}
