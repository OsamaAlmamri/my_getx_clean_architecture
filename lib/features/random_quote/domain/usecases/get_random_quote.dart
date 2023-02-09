import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/core/usecases/usecase.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/entities/quote.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/repositories/quote_repository.dart';
import '../../../../core/error/failures.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  // final QuoteRepositoryImpl quoteRepositor;

  final QuoteRepositoryImpl  quoteRepository;

  GetRandomQuote({ required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
