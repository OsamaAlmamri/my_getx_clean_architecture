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
    print("dependencies");
    //// Blocs
    //   sl.registerFactory<RandomQuoteCubit>(
    //           () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

    Get.lazyPut(() => RandomQuoteController(getRandomQuoteUseCase: Get.find()));


    //   // Use cases
    //   sl.registerLazySingleton<GetRandomQuote>(
    //           () => GetRandomQuote(quoteRepository: sl()));
    Get.lazyPut(() => GetRandomQuote(quoteRepository: Get.find()));



    //   // Repository
    // Get.lazyPut(() => QuoteRepository());
    Get.lazyPut(() => QuoteRepositoryImpl());
    // Get.lazyPut(() => QuoteRepository(Get.find<QuoteRepositoryImpl>()));
    //   sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
    //       networkInfo: sl(),
    //       randomQuoteRemoteDataSource: sl(),
    //       randomQuoteLocalDataSource: sl()));

    //   // Data Sources
    Get.lazyPut(() => RandomQuoteLocalDataSourceImpl());
    Get.lazyPut(() => RandomQuoteRemoteDataSourceImpl());
    // Get.put(RandomQuoteRemoteDataSource());

    // Get.lazyPut(() => GetRandomQuote(Get.find<QuoteRepositoryImpl>()));
  }
}
