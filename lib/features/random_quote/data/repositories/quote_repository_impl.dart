import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/error/exceptions.dart';
import 'package:my_getx_clean_architecture/core/network/netwok_info.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/entities/quote.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfoImpl networkInfo= Get.find();
  final RandomQuoteRemoteDataSourceImpl randomQuoteRemoteDataSource= Get.find();
  final RandomQuoteLocalDataSourceImpl randomQuoteLocalDataSource= Get.find();



  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
